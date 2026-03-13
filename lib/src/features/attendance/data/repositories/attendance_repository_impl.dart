import 'package:dio/dio.dart';

import '../../../../core/error/app_exception.dart';
import '../../domain/entities/attendance_scan_result.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../datasources/attendance_remote_data_source.dart';
import '../mappers/attendance_scan_mapper.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  const AttendanceRepositoryImpl({
    required AttendanceRemoteDataSource remoteDataSource,
    required String deviceId,
  }) : _remoteDataSource = remoteDataSource,
       _deviceId = deviceId;

  final AttendanceRemoteDataSource _remoteDataSource;
  final String _deviceId;

  @override
  Future<AttendanceScanResult> scanAttendance({required String qrCode}) async {
    final normalizedQr = qrCode.trim();
    if (normalizedQr.isEmpty) {
      throw const AppException('QR code is empty. Please try again.', code: 422);
    }

    try {
      final response = await _remoteDataSource.scanAttendance(
        qrCode: normalizedQr,
        deviceId: _deviceId,
      );
      return response.toEntity();
    } on DioException catch (error) {
      throw AppException(
        _resolveMessage(error),
        code: error.response?.statusCode,
      );
    } catch (_) {
      throw const AppException('Unexpected error. Please try scanning again.');
    }
  }

  String _resolveMessage(DioException error) {
    final statusCode = error.response?.statusCode;
    final dynamic responseData = error.response?.data;

    if (responseData is Map<String, dynamic>) {
      final backendMessage = responseData['message'];
      if (backendMessage is String && backendMessage.trim().isNotEmpty) {
        return backendMessage;
      }

      final validationErrors = responseData['errors'];
      if (validationErrors is Map<String, dynamic>) {
        for (final value in validationErrors.values) {
          if (value is List && value.isNotEmpty && value.first is String) {
            return value.first as String;
          }
        }
      }
    }

    switch (statusCode) {
      case 404:
        return 'Student QR not found.';
      case 429:
        return 'Duplicate scan detected. Please wait before scanning again.';
      case 422:
        return 'Invalid scan payload. Please check QR code and try again.';
      default:
        return 'Request failed with status code ${statusCode ?? 0}.';
    }
  }
}
