// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_scan_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceScanResponseModel _$AttendanceScanResponseModelFromJson(
  Map<String, dynamic> json,
) => _AttendanceScanResponseModel(
  success: json['success'] as bool,
  message: json['message'] as String,
  student: json['student'] == null
      ? null
      : StudentResponseModel.fromJson(json['student'] as Map<String, dynamic>),
  attendance: json['attendance'] == null
      ? null
      : AttendanceResponseModel.fromJson(
          json['attendance'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AttendanceScanResponseModelToJson(
  _AttendanceScanResponseModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'student': instance.student,
  'attendance': instance.attendance,
};

_StudentResponseModel _$StudentResponseModelFromJson(
  Map<String, dynamic> json,
) => _StudentResponseModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  studentNo: json['student_no'] as String,
);

Map<String, dynamic> _$StudentResponseModelToJson(
  _StudentResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'student_no': instance.studentNo,
};

_AttendanceResponseModel _$AttendanceResponseModelFromJson(
  Map<String, dynamic> json,
) => _AttendanceResponseModel(
  type: json['type'] as String,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$AttendanceResponseModelToJson(
  _AttendanceResponseModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'time': instance.time?.toIso8601String(),
};
