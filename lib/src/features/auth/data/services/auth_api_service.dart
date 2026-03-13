import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../core/error/app_exception.dart';
import '../models/login_response_model.dart';

class AuthApiService {
  AuthApiService({required this.baseUrl, required http.Client httpClient})
    : _httpClient = httpClient;

  final String baseUrl;
  final http.Client _httpClient;

  Future<LoginResponseModel> login({
    required String email,
    required String password,
    String deviceName = 'flutter-mobile',
  }) async {
    final uri = Uri.parse('$baseUrl/api/login');

    try {
      final response = await _httpClient.post(
        uri,
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email.trim(),
          'password': password,
          'device_name': deviceName,
        }),
      );

      final json = _decodeJson(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (json is! Map<String, dynamic>) {
          throw const AppException('Invalid server response.');
        }
        return LoginResponseModel.fromJson(json);
      }

      throw AppException(
        _errorMessageFromJson(json) ??
            'Login failed with status code ${response.statusCode}.',
        code: response.statusCode,
      );
    } on SocketException {
      throw const AppException(
        'Network unreachable. Check your API base URL and connection.',
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

  String? _errorMessageFromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      final message = json['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
    }
    return null;
  }
}
