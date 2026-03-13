// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_scan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceScanRequest _$AttendanceScanRequestFromJson(
  Map<String, dynamic> json,
) => AttendanceScanRequest(
  qrCode: json['qr_code'] as String,
  deviceId: json['device_id'] as String,
);

Map<String, dynamic> _$AttendanceScanRequestToJson(
  AttendanceScanRequest instance,
) => <String, dynamic>{
  'qr_code': instance.qrCode,
  'device_id': instance.deviceId,
};
