import '../entities/attendance_scan_result.dart';

abstract class AttendanceRepository {
  Future<AttendanceScanResult> scanAttendance({required String qrCode});
}
