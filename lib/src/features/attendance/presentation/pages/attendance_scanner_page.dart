import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../bloc/scanner/scanner_bloc.dart';
import '../bloc/scanner/scanner_event.dart';
import '../bloc/scanner/scanner_state.dart';

class AttendanceScannerPage extends StatefulWidget {
  const AttendanceScannerPage({super.key});

  @override
  State<AttendanceScannerPage> createState() => _AttendanceScannerPageState();
}

class _AttendanceScannerPageState extends State<AttendanceScannerPage> {
  late final MobileScannerController _scannerController;

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

  void _onCapture(BarcodeCapture capture) {
    if (capture.barcodes.isEmpty) {
      return;
    }

    final rawValue = capture.barcodes.first.rawValue;
    if (rawValue == null || rawValue.trim().isEmpty) {
      return;
    }

    context.read<ScannerBloc>().add(ScannerEvent.qrDetected(rawValue));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScannerBloc, ScannerState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (result) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result.message),
                backgroundColor: Colors.green.shade700,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red.shade700,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Attendance QR Scanner')),
        body: Column(
          children: [
            Expanded(
              child: MobileScanner(
                controller: _scannerController,
                onDetect: _onCapture,
              ),
            ),
            BlocBuilder<ScannerBloc, ScannerState>(
              builder: (context, state) {
                final isSending = state.maybeWhen(
                  sending: () => true,
                  orElse: () => false,
                );
                if (!isSending) {
                  return const SizedBox.shrink();
                }

                return const Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 20),
                  child: LinearProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
