import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_scan_result.freezed.dart';

@freezed
abstract class AttendanceScanResult with _$AttendanceScanResult {
  const factory AttendanceScanResult({
    required bool success,
    required String message,
    ScannedStudent? student,
    ScannedAttendance? attendance,
  }) = _AttendanceScanResult;
}

@freezed
abstract class ScannedStudent with _$ScannedStudent {
  const factory ScannedStudent({
    required int id,
    required String name,
    required String studentNo,
  }) = _ScannedStudent;
}

@freezed
abstract class ScannedAttendance with _$ScannedAttendance {
  const factory ScannedAttendance({
    required String type,
    required DateTime? time,
  }) = _ScannedAttendance;
}
