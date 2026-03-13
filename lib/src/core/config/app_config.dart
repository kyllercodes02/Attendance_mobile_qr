class AppConfig {
  AppConfig._();

  // Android emulator: http://10.0.2.2:8000
  // iOS simulator: http://127.0.0.1:8000
  // Physical device: http://<your-lan-ip>:8000
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  static const String scannerDeviceId = String.fromEnvironment(
    'SCANNER_DEVICE_ID',
    defaultValue: 'flutter-device-01',
  );
}
