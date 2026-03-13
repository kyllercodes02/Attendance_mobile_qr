import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../bloc/scanner/scanner_bloc.dart';
import '../bloc/scanner/scanner_event.dart';
import '../bloc/scanner/scanner_state.dart';

class AdminScannerPage extends StatefulWidget {
  const AdminScannerPage({super.key, required this.email});

  final String email;

  @override
  State<AdminScannerPage> createState() => _AdminScannerPageState();
}

class _AdminScannerPageState extends State<AdminScannerPage> {
  final MobileScannerController _scannerController = MobileScannerController(
    autoStart: true,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  void _onDetect(BarcodeCapture capture) {
    if (capture.barcodes.isEmpty) {
      return;
    }

    final rawValue = capture.barcodes.first.rawValue;
    if (rawValue == null || rawValue.trim().isEmpty) {
      return;
    }

    context.read<ScannerBloc>().add(ScannerEvent.qrDetected(rawValue));
  }

  void _showSnack(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade700 : Colors.green.shade700,
      ),
    );
  }

  Future<void> _resetScanner() async {
    context.read<ScannerBloc>().add(const ScannerEvent.reset());
    await _scannerController.start();
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (result) {
            _showSnack(
              '${result.message} | ${result.student?.name ?? ''} ${result.attendance?.type ?? ''}',
              isError: false,
            );
          },
          error: (message) {
            _showSnack(message, isError: true);
          },
        );
      },
      builder: (context, state) {
        final isSending = state.maybeWhen(sending: () => true, orElse: () => false);
        final result = state.maybeWhen(success: (value) => value, orElse: () => null);
        final error = state.maybeWhen(error: (message) => message, orElse: () => null);

        final student = result?.student;
        final attendance = result?.attendance;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Student Attendance Scanner'),
            actions: [
              IconButton(
                tooltip: 'Back to dashboard',
                onPressed: () =>
                    context.go('/admin/dashboard', extra: widget.email),
                icon: const Icon(Icons.dashboard_outlined),
              ),
              IconButton(
                tooltip: 'Logout',
                onPressed: () => context.go('/login'),
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
                            'Scanner ready',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Scan student QR to record attendance and sync to web dashboard.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MobileScanner(
                        controller: _scannerController,
                        onDetect: _onDetect,
                        errorBuilder: (context, error) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Camera error: ${error.errorDetails?.message ?? error.errorCode.name}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: isSending
                          ? const Text('Sending attendance to server...')
                          : error != null
                          ? Text('Error: $error')
                          : result != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(result.message),
                                const SizedBox(height: 8),
                                Text('Student: ${student?.name ?? '-'}'),
                                Text('Student No: ${student?.studentNo ?? '-'}'),
                                Text('Type: ${attendance?.type ?? '-'}'),
                                Text(
                                  'Time: ${attendance?.time?.toLocal().toIso8601String() ?? '-'}',
                                ),
                              ],
                            )
                          : const Text('Waiting for scan...'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: isSending ? null : _resetScanner,
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text('Scan Again'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
