import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/app/app_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dependencies = AppDependencies();
  await dependencies.authController.restoreSession();

  runApp(AttendanceQrApp(dependencies: dependencies));
}
