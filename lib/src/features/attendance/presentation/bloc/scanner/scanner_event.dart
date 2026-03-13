import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_event.freezed.dart';

@freezed
abstract class ScannerEvent with _$ScannerEvent {
  const factory ScannerEvent.qrDetected(String qrValue) = _QrDetected;
  const factory ScannerEvent.reset() = _Reset;
}
