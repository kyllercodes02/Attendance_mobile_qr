import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/attendance_scan_result.dart';

part 'scanner_state.freezed.dart';

@freezed
abstract class ScannerState with _$ScannerState {
  const factory ScannerState.initial() = _Initial;
  const factory ScannerState.sending() = _Sending;
  const factory ScannerState.success(AttendanceScanResult result) = _Success;
  const factory ScannerState.error(String message) = _Error;
}
