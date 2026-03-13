import '../entities/attendance_scan_result.dart';
import '../repositories/attendance_repository.dart';

class ScanAttendanceUseCase {
  const ScanAttendanceUseCase(this._repository);

  final AttendanceRepository _repository;

  Future<AttendanceScanResult> call({required String qrCode}) {
    return _repository.scanAttendance(qrCode: qrCode);
  }
}
