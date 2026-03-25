import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../core/config/app_config.dart';
import '../features/attendance/data/services/attendance_api_http_service.dart';
import '../features/attendance/data/services/teacher_dashboard_api_service.dart';
import '../features/auth/data/datasources/auth_secure_storage.dart';
import '../features/auth/data/services/auth_api_service.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';

class AppDependencies {
  AppDependencies()
    : _httpClient = http.Client(),
      _secureStorage = const FlutterSecureStorage() {
    final authStorage = AuthSecureStorage(_secureStorage);

    final authApiService = AuthApiService(
      baseUrl: AppConfig.apiBaseUrl,
      httpClient: _httpClient,
    );

    authController = AuthController(
      authApiService: authApiService,
      secureStorage: authStorage,
    );

    attendanceApiHttpService = AttendanceApiHttpService(
      baseUrl: AppConfig.apiBaseUrl,
      httpClient: _httpClient,
    );

    teacherDashboardApiService = TeacherDashboardApiService(
      baseUrl: AppConfig.apiBaseUrl,
      httpClient: _httpClient,
    );
  }

  final http.Client _httpClient;
  final FlutterSecureStorage _secureStorage;

  late final AuthController authController;
  late final AttendanceApiHttpService attendanceApiHttpService;
  late final TeacherDashboardApiService teacherDashboardApiService;

  void dispose() {
    authController.dispose();
    _httpClient.close();
  }
}
