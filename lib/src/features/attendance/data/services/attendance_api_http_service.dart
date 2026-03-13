import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/error/app_exception.dart';
import '../models/attendance_scan_request.dart';
import '../models/attendance_scan_response_model.dart';

class AttendanceApiHttpService {
  AttendanceApiHttpService({required this.baseUrl, required http.Client httpClient})
    : _httpClient = httpClient;

  final String baseUrl;
  final http.Client _httpClient;

  Future<AttendanceScanResponseModel> scanAttendance({
    required String token,
    required AttendanceScanRequest request,
  }) async {
    final preferredUri = Uri.parse('$baseUrl/api/student-attendance/scan');
    final fallbackUri = Uri.parse('$baseUrl/api/attendance/scan');

    final preferredResponse = await _sendScanRequest(
      uri: preferredUri,
      token: token,
      request: request,
    );

    if (preferredResponse.isSuccess) {
      return preferredResponse.data!;
    }

    if (preferredResponse.shouldUseFallback) {
      final fallbackResponse = await _sendScanRequest(
        uri: fallbackUri,
        token: token,
        request: request,
      );
      if (fallbackResponse.isSuccess) {
        return fallbackResponse.data!;
      }
      throw AppException(
        fallbackResponse.message ?? 'Failed to submit attendance scan.',
        code: fallbackResponse.statusCode,
      );
    }

    throw AppException(
      preferredResponse.message ?? 'Failed to submit attendance scan.',
      code: preferredResponse.statusCode,
    );
  }

  Future<_ScanCallResult> _sendScanRequest({
    required Uri uri,
    required String token,
    required AttendanceScanRequest request,
  }) async {
    try {
      final response = await _httpClient.post(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      final json = _decodeJson(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (json is! Map<String, dynamic>) {
          return const _ScanCallResult(
            statusCode: 500,
            message: 'Invalid server response.',
          );
        }

        return _ScanCallResult(
          isSuccess: true,
          statusCode: response.statusCode,
          data: AttendanceScanResponseModel.fromJson(json),
        );
      }

      return _ScanCallResult(
        statusCode: response.statusCode,
        message: _errorMessageFromResponse(response.statusCode, json),
        shouldUseFallback: _shouldUseFallback(response.statusCode, json),
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

  String _errorMessageFromResponse(int statusCode, Object? json) {
    final backendMessage = _extractMessage(json);
    if (backendMessage != null && backendMessage.trim().isNotEmpty) {
      return backendMessage;
    }

    switch (statusCode) {
      case 401:
        return 'Unauthorized. Please log in again.';
      case 404:
        return 'Student QR not found';
      case 429:
        return 'Duplicate scan within 10 seconds';
      default:
        return 'Request failed with status code $statusCode.';
    }
  }

  bool _shouldUseFallback(int statusCode, Object? json) {
    if (statusCode != 404) {
      return false;
    }

    final backendMessage = _extractMessage(json)?.toLowerCase();
    if (backendMessage == null || backendMessage.isEmpty) {
      return true;
    }

    if (backendMessage.contains('student qr not found')) {
      return false;
    }

    if (backendMessage.contains('route') || backendMessage.contains('not found')) {
      return true;
    }

    return false;
  }

  String? _extractMessage(Object? json) {
    if (json is Map<String, dynamic>) {
      final message = json['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }

      final errors = json['errors'];
      if (errors is Map<String, dynamic>) {
        for (final value in errors.values) {
          if (value is List && value.isNotEmpty) {
            final first = value.first;
            if (first is String && first.trim().isNotEmpty) {
              return first;
            }
          }
        }
      }
    }
    return null;
  }
}

class _ScanCallResult {
  const _ScanCallResult({
    this.isSuccess = false,
    this.shouldUseFallback = false,
    this.statusCode,
    this.message,
    this.data,
  });

  final bool isSuccess;
  final bool shouldUseFallback;
  final int? statusCode;
  final String? message;
  final AttendanceScanResponseModel? data;
}
