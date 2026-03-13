import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/error/app_exception.dart';
import '../../data/mappers/attendance_scan_mapper.dart';
import '../../data/models/attendance_scan_request.dart';
import '../../data/services/attendance_api_http_service.dart';
import '../../domain/entities/attendance_scan_result.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late final MobileScannerController _scannerController;

  bool _isSubmitting = false;
  AttendanceScanResult? _lastResult;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      autoStart: true,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_isSubmitting || capture.barcodes.isEmpty) {
      return;
    }

    final rawValue = capture.barcodes.first.rawValue?.trim();
    if (rawValue == null || rawValue.isEmpty) {
      return;
    }

    final authController = context.read<AuthController>();
    if (!authController.isTeacher) {
      context.go(
        '/unauthorized?message=Only%20teacher%20accounts%20can%20use%20the%20QR%20scanner.',
      );
      return;
    }

    final token = authController.token;
    if (token == null || token.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Session expired. Please log in again.')),
      );
      await authController.logout();
      if (!mounted) {
        return;
      }
      context.go('/login');
      return;
    }

    final attendanceApi = context.read<AttendanceApiHttpService>();

    setState(() {
      _isSubmitting = true;
      _lastError = null;
    });

    await _scannerController.stop();

    try {
      final response = await attendanceApi.scanAttendance(
        token: token,
        request: AttendanceScanRequest(
          qrCode: rawValue,
          deviceId: AppConfig.scannerDeviceId,
        ),
      );

      final result = response.toEntity();

      if (!mounted) {
        return;
      }

      setState(() {
        _lastResult = result;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.message),
          backgroundColor: Colors.green.shade700,
        ),
      );
    } on AppException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _lastError = error.message;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red.shade700,
        ),
      );

      if (error.code == 401) {
        await authController.logout();
        if (!mounted) {
          return;
        }
        context.go('/login');
      }
    } catch (_) {
      if (!mounted) {
        return;
      }

      const unknownMessage = 'Unexpected error. Please try scanning again.';
      setState(() {
        _lastError = unknownMessage;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(unknownMessage),
          backgroundColor: Colors.red.shade700,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
        await _scannerController.start();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    final user = authController.user;
    final student = _lastResult?.student;
    final attendance = _lastResult?.attendance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher QR Scanner'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () async {
              await authController.logout();
              if (!context.mounted) {
                return;
              }
              context.go('/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Logged in teacher: ${user?.name ?? '-'}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 6),
                      Text('Email: ${user?.email ?? '-'}'),
                      Text('Device ID: ${AppConfig.scannerDeviceId}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: MobileScanner(
                    controller: _scannerController,
                    onDetect: _onDetect,
                    errorBuilder: (context, error) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Camera error: ${error.errorDetails?.message ?? error.errorCode.name}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (_isSubmitting)
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: LinearProgressIndicator(),
                ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _isSubmitting
                      ? const Text('Submitting scan...')
                      : _lastError != null
                      ? Text('Error: $_lastError')
                      : _lastResult == null
                      ? const Text('Waiting for scan...')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_lastResult!.message),
                            const SizedBox(height: 8),
                            Text('Student: ${student?.name ?? '-'}'),
                            Text('Student No: ${student?.studentNo ?? '-'}'),
                            Text('Type: ${attendance?.type ?? '-'}'),
                            Text(
                              'Time: ${attendance?.time?.toLocal().toIso8601String() ?? '-'}',
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
