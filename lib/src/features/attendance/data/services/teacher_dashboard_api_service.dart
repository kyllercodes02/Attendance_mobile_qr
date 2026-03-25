import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/error/app_exception.dart';
import '../models/teacher_dashboard_data.dart';

class TeacherDashboardApiService {
  TeacherDashboardApiService({
    required this.baseUrl,
    required http.Client httpClient,
  }) : _httpClient = httpClient;

  final String baseUrl;
  final http.Client _httpClient;

  static const List<String> _dashboardEndpoints = [
    '/api/teacher/dashboard',
    '/api/teacher/overview',
  ];

  Future<TeacherDashboardData> getDashboardData({required String token}) async {
    _ApiCallResult? lastFailure;

    for (final path in _dashboardEndpoints) {
      final uri = Uri.parse('$baseUrl$path');
      final result = await _sendGet(uri: uri, token: token);
      if (result.isSuccess && result.data != null) {
        return TeacherDashboardData.fromJson(result.data!);
      }

      if (result.statusCode == 404) {
        lastFailure = result;
        continue;
      }

      throw AppException(
        result.message ?? 'Unable to load teacher dashboard.',
        code: result.statusCode,
      );
    }

    throw AppException(
      'Teacher dashboard endpoint is not available. Tried: ${_dashboardEndpoints.join(', ')}',
      code: lastFailure?.statusCode,
    );
  }

  Future<_ApiCallResult> _sendGet({
    required Uri uri,
    required String token,
  }) async {
    try {
      final response = await _httpClient.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final json = _decodeJson(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (json is Map<String, dynamic>) {
          return _ApiCallResult(
            isSuccess: true,
            statusCode: response.statusCode,
            data: json,
          );
        }
        if (json is Map) {
          return _ApiCallResult(
            isSuccess: true,
            statusCode: response.statusCode,
            data: json.cast<String, dynamic>(),
          );
        }
        return const _ApiCallResult(
          statusCode: 500,
          message: 'Invalid dashboard response payload.',
        );
      }

      return _ApiCallResult(
        statusCode: response.statusCode,
        message:
            _readMessage(json) ??
            'Request failed with status ${response.statusCode}.',
      );
    } on SocketException {
      throw const AppException(
        'Network unreachable. Check API base URL and connection.',
      );
    } on http.ClientException {
      throw const AppException('Unable to contact server. Please try again.');
    } on FormatException {
      throw const AppException('Malformed response from server.');
    }
  }

  Object? _decodeJson(String body) {
    if (body.trim().isEmpty) {
      return null;
    }
    return jsonDecode(body);
  }

  String? _readMessage(Object? json) {
    if (json is Map<String, dynamic>) {
      final message = json['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message.trim();
      }
    }
    return null;
  }
}

class _ApiCallResult {
  const _ApiCallResult({
    this.isSuccess = false,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool isSuccess;
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? data;
}
