import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../domain/usecases/scan_attendance_use_case.dart';
import 'scanner_event.dart';
import 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc({required ScanAttendanceUseCase scanAttendanceUseCase})
    : _scanAttendanceUseCase = scanAttendanceUseCase,
      super(const ScannerState.initial()) {
    on<ScannerEvent>(_onEvent);
  }

  final ScanAttendanceUseCase _scanAttendanceUseCase;
  DateTime? _lastRequestAt;

  Future<void> _onEvent(ScannerEvent event, Emitter<ScannerState> emit) async {
    await event.when(
      qrDetected: (qrValue) async {
        final isSending = state.maybeWhen(
          sending: () => true,
          orElse: () => false,
        );
        if (!_isPastCooldown() || isSending) {
          return;
        }

        final normalized = qrValue.trim();
        if (normalized.isEmpty) {
          return;
        }

        _lastRequestAt = DateTime.now();
        emit(const ScannerState.sending());

        try {
          final result = await _scanAttendanceUseCase(qrCode: normalized);
          emit(ScannerState.success(result));
        } on AppException catch (error) {
          emit(ScannerState.error(error.message));
        } catch (_) {
          emit(
            const ScannerState.error('Unexpected error. Please try scanning again.'),
          );
        }
      },
      reset: () async {
        _lastRequestAt = null;
        emit(const ScannerState.initial());
      },
    );
  }

  bool _isPastCooldown() {
    if (_lastRequestAt == null) {
      return true;
    }
    return DateTime.now().difference(_lastRequestAt!) >=
        const Duration(seconds: 10);
  }
}
