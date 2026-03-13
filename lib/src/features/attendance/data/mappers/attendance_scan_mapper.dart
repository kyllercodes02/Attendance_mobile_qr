import '../../domain/entities/attendance_scan_result.dart';
import '../models/attendance_scan_response_model.dart';

extension AttendanceScanResponseMapper on AttendanceScanResponseModel {
  AttendanceScanResult toEntity() {
    return AttendanceScanResult(
      success: success,
      message: message,
      student: student?.toEntity(),
      attendance: attendance?.toEntity(),
    );
  }
}

extension StudentResponseMapper on StudentResponseModel {
  ScannedStudent toEntity() {
    return ScannedStudent(id: id, name: name, studentNo: studentNo);
  }
}

extension AttendanceResponseMapper on AttendanceResponseModel {
  ScannedAttendance toEntity() {
    return ScannedAttendance(type: type, time: time);
  }
}
