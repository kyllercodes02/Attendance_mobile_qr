import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_scan_response_model.freezed.dart';
part 'attendance_scan_response_model.g.dart';

@Freezed(fromJson: true, toJson: true)
abstract class AttendanceScanResponseModel with _$AttendanceScanResponseModel {
  const factory AttendanceScanResponseModel({
    required bool success,
    required String message,
    StudentResponseModel? student,
    AttendanceResponseModel? attendance,
  }) = _AttendanceScanResponseModel;

  factory AttendanceScanResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AttendanceScanResponseModelFromJson(json);
  }
}

@Freezed(fromJson: true, toJson: true)
abstract class StudentResponseModel with _$StudentResponseModel {
  const factory StudentResponseModel({
    required int id,
    required String name,
    @JsonKey(name: 'student_no') required String studentNo,
  }) = _StudentResponseModel;

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$StudentResponseModelFromJson(json);
  }
}

@Freezed(fromJson: true, toJson: true)
abstract class AttendanceResponseModel with _$AttendanceResponseModel {
  const factory AttendanceResponseModel({
    required String type,
    required DateTime? time,
  }) = _AttendanceResponseModel;

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AttendanceResponseModelFromJson(json);
  }
}
