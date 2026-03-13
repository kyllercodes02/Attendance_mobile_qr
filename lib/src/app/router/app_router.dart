import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../../features/attendance/presentation/pages/qr_scanner_page.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/unauthorized_page.dart';
import '../app_dependencies.dart';

class AppRouter {
  AppRouter(this._dependencies);

  final AppDependencies _dependencies;

  late final GoRouter router = GoRouter(
    initialLocation: '/login',
    refreshListenable: _dependencies.authController,
    redirect: (context, state) {
      final authController = _dependencies.authController;
      final path = state.uri.path;
      final isLoggedIn = authController.isAuthenticated;

      if (authController.status == AuthStatus.unknown ||
          authController.status == AuthStatus.loading) {
        return null;
      }

      final isAuthRoute = path == '/login';
      final isUnauthorizedRoute = path == '/unauthorized';

      if (!isLoggedIn && !isAuthRoute) {
        return '/login';
      }

      if (isLoggedIn && isAuthRoute) {
        if (authController.isAdmin) {
          return '/admin/dashboard';
        }
        if (authController.isTeacher) {
          return '/teacher/scanner';
        }
        return '/unauthorized?message=Unsupported%20role.%20Please%20contact%20administrator.';
      }

      if (path == '/scanner') {
        if (authController.isTeacher) {
          return '/teacher/scanner';
        }
        return '/unauthorized?message=Only%20teacher%20accounts%20can%20use%20the%20QR%20scanner.';
      }

      if (path.startsWith('/teacher') && !authController.isTeacher) {
        return '/unauthorized?message=Only%20teacher%20accounts%20can%20access%20scanner%20pages.';
      }

      if (path.startsWith('/admin') && !authController.isAdmin) {
        return '/unauthorized?message=Only%20admin%20accounts%20can%20access%20dashboard%20pages.';
      }

      if (!isLoggedIn && isUnauthorizedRoute) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/admin/dashboard',
        builder: (context, state) => const AdminDashboardPage(),
      ),
      GoRoute(path: '/teacher/scanner', builder: (context, state) => const QrScannerPage()),
      GoRoute(path: '/scanner', builder: (context, state) => const QrScannerPage()),
      GoRoute(
        path: '/unauthorized',
        builder: (context, state) =>
            UnauthorizedPage(message: state.uri.queryParameters['message']),
      ),
    ],
  );
}
