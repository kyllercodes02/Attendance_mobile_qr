import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/admin_dashboard.dart';
import '../pages/login_page.dart';
import '../pages/student_dashboard.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/admin',
        builder: (context, state) {
          final email = state.extra is String ? state.extra! as String : '';
          return AdminDashboardPage(email: email);
        },
      ),
      GoRoute(
        path: '/student',
        builder: (context, state) {
          final email = state.extra is String ? state.extra! as String : '';
          return StudentDashboardPage(email: email);
        },
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
