import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/attendance/data/services/attendance_api_http_service.dart';
import '../features/attendance/data/services/teacher_dashboard_api_service.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';
import 'app_dependencies.dart';
import 'router/app_router.dart';

class AttendanceQrApp extends StatefulWidget {
  const AttendanceQrApp({super.key, required this.dependencies});

  final AppDependencies dependencies;

  @override
  State<AttendanceQrApp> createState() => _AttendanceQrAppState();
}

class _AttendanceQrAppState extends State<AttendanceQrApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(widget.dependencies);
  }

  @override
  void dispose() {
    widget.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(
          value: widget.dependencies.authController,
        ),
        Provider<AttendanceApiHttpService>.value(
          value: widget.dependencies.attendanceApiHttpService,
        ),
        Provider<TeacherDashboardApiService>.value(
          value: widget.dependencies.teacherDashboardApiService,
        ),
      ],
      child: MaterialApp.router(
        title: 'School Attendance',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        ),
        routerConfig: _appRouter.router,
      ),
    );
  }
}
