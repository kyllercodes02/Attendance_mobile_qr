import 'package:json_annotation/json_annotation.dart';

part 'attendance_scan_request.g.dart';

@JsonSerializable()
class AttendanceScanRequest {
  const AttendanceScanRequest({
    required this.qrCode,
    required this.deviceId,
  });

  @JsonKey(name: 'qr_code')
  final String qrCode;

  @JsonKey(name: 'device_id')
  final String deviceId;

  factory AttendanceScanRequest.fromJson(Map<String, dynamic> json) {
    return _$AttendanceScanRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttendanceScanRequestToJson(this);
}
