import '../models/attendance_scan_request.dart';
import '../models/attendance_scan_response_model.dart';
import '../services/attendance_api_service.dart';

class AttendanceRemoteDataSource {
  const AttendanceRemoteDataSource(this._apiService);

  final AttendanceApiService _apiService;

  Future<AttendanceScanResponseModel> scanAttendance({
    required String qrCode,
    required String deviceId,
  }) {
    return _apiService.scanAttendance(
      AttendanceScanRequest(qrCode: qrCode, deviceId: deviceId),
    );
  }
}
