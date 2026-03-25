import 'dart:async';
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

class _QrScannerPageState extends State<QrScannerPage>
    with SingleTickerProviderStateMixin {
  late final MobileScannerController _scannerController;
  late final AnimationController _animationController;

  bool _isSubmitting = false;
  AttendanceScanResult? _lastResult;
  String? _lastError;
  bool _isFlashOn = false;
  Timer? _feedbackTimer;

  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      autoStart: true,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _feedbackTimer?.cancel();
    _animationController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _showFeedback() {
    _feedbackTimer?.cancel();
    _feedbackTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _lastResult = null;
          _lastError = null;
        });
      }
    });
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
      _lastResult = null;
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
      _showFeedback();
    } on AppException catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _lastError = error.message;
      });
      _showFeedback();

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

      setState(() {
        _lastError = 'Unexpected error. Please try scanning again.';
      });
      _showFeedback();
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          await _scannerController.start();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate background
      body: LayoutBuilder(builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        Widget content = Stack(
          children: [
            // Camera Preview inside a rounded container
            Positioned.fill(
              child: _buildScannerView(context),
            ),

            // App Bar / Top Controls
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildTopControls(context),
            ),

            // Submitting Indicator
            if (_isSubmitting)
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xFF38BDF8)),
                ),
              ),

            // Feedback Card
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: _buildFeedbackCard(),
            ),
          ],
        );

        if (isDesktop) {
          return Stack(
            children: [
              // Dark blurred background for desktop modal appearance
              Positioned.fill(
                child: Container(color: Colors.black54),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 480,
                    height: 720,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: content,
                  ),
                ),
              ),
            ],
          );
        }

        return content;
      }),
    );
  }

  Widget _buildScannerView(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MobileScanner(
          controller: _scannerController,
          onDetect: _onDetect,
          errorBuilder: (context, error) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Camera error: ${error.errorDetails?.message ?? error.errorCode.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),

        // Overlay for darkened unselected area
        CustomPaint(
          painter: _ScannerOverlayPainter(
            scanWindowSize: const Size(260, 260),
            borderRadius: 24,
          ),
        ),

        // Scanning window with animation and corners
        Center(
          child: SizedBox(
            width: 260,
            height: 260,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: _animationController.value * (260 - 2),
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: const Color(0xFF38BDF8),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF38BDF8).withValues(alpha: 0.8),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Corner highlights
                CustomPaint(
                  painter: _ScannerCornersPainter(
                    color: const Color(0xFF38BDF8),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Instruction text
        const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 340),
            child: Text(
              'Align QR inside the frame',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopControls(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Close Button
            IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black45,
                shape: const CircleBorder(),
              ),
            ),
            Row(
              children: [
                // Flash Toggle
                IconButton(
                  onPressed: () {
                    _scannerController.toggleTorch();
                    setState(() {
                      _isFlashOn = !_isFlashOn;
                    });
                  },
                  icon: Icon(
                    _isFlashOn ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                    size: 26,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black45,
                    shape: const CircleBorder(),
                  ),
                ),
                const SizedBox(width: 12),
                // Switch Camera Toggle
                IconButton(
                  onPressed: () => _scannerController.switchCamera(),
                  icon: const Icon(Icons.flip_camera_ios,
                      color: Colors.white, size: 26),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black45,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackCard() {
    if (_lastResult == null && _lastError == null) {
      return const SizedBox.shrink();
    }

    final isSuccess = _lastResult != null;
    final color = isSuccess ? Colors.green.shade600 : Colors.red.shade600;
    final icon = isSuccess ? Icons.check_circle : Icons.error;
    final title = isSuccess ? 'Scan Successful' : 'Scan Failed';

    final student = _lastResult?.student;
    final attendance = _lastResult?.attendance;
    final time = attendance?.time?.toLocal();
    final timeStr = time != null
        ? '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
        : '-';

    return TweenAnimationBuilder<double>(
      key: ValueKey('$_lastResult$_lastError'),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (isSuccess && student != null) ...[
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      '${attendance?.type ?? 'Attendance'} at $timeStr',
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 13,
                      ),
                    ),
                  ] else if (_lastError != null) ...[
                    Text(
                      _lastError!,
                      style: const TextStyle(
                        color: Color(0xFF475569),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  _ScannerOverlayPainter({
    required this.scanWindowSize,
    required this.borderRadius,
  });

  final Size scanWindowSize;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = Colors.black.withValues(alpha: 0.65);

    final windowRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: scanWindowSize.width,
      height: scanWindowSize.height,
    );

    final windowRRect = RRect.fromRectAndRadius(
      windowRect,
      Radius.circular(borderRadius),
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()..addRRect(windowRRect),
      ),
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScannerCornersPainter extends CustomPainter {
  _ScannerCornersPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double cornerLength = 30.0;
    final double w = size.width;
    final double h = size.height;

    final path = Path()
      // Top left
      ..moveTo(0, cornerLength)
      ..lineTo(0, 12)
      ..quadraticBezierTo(0, 0, 12, 0)
      ..lineTo(cornerLength, 0)
      
      // Top right
      ..moveTo(w - cornerLength, 0)
      ..lineTo(w - 12, 0)
      ..quadraticBezierTo(w, 0, w, 12)
      ..lineTo(w, cornerLength)
      
      // Bottom left
      ..moveTo(0, h - cornerLength)
      ..lineTo(0, h - 12)
      ..quadraticBezierTo(0, h, 12, h)
      ..lineTo(cornerLength, h)
      
      // Bottom right
      ..moveTo(w - cornerLength, h)
      ..lineTo(w - 12, h)
      ..quadraticBezierTo(w, h, w, h - 12)
      ..lineTo(w, h - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
