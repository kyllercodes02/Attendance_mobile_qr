import 'package:flutter/foundation.dart';

import '../../../../core/error/app_exception.dart';
import '../../data/datasources/auth_secure_storage.dart';
import '../../data/services/auth_api_service.dart';
import '../../domain/entities/authenticated_user.dart';

enum AuthStatus { unknown, loading, authenticated, unauthenticated }

class AuthController extends ChangeNotifier {
  AuthController({
    required AuthApiService authApiService,
    required AuthSecureStorage secureStorage,
  }) : _authApiService = authApiService,
       _secureStorage = secureStorage;

  final AuthApiService _authApiService;
  final AuthSecureStorage _secureStorage;

  AuthStatus _status = AuthStatus.unknown;
  AuthenticatedUser? _user;
  String? _token;
  String? _errorMessage;

  AuthStatus get status => _status;
  AuthenticatedUser? get user => _user;
  String? get token => _token;
  String? get errorMessage => _errorMessage;

  bool get isAuthenticated =>
      _status == AuthStatus.authenticated && _token != null && _user != null;
  bool get isAdmin => _user?.primaryRole.toLowerCase() == 'admin';
  bool get isTeacher => _user?.primaryRole.toLowerCase() == 'teacher';

  Future<void> restoreSession() async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final savedToken = await _secureStorage.readToken();
      final savedUser = await _secureStorage.readUser();

      if (savedToken == null || savedUser == null) {
        _token = null;
        _user = null;
        _status = AuthStatus.unauthenticated;
        notifyListeners();
        return;
      }

      _token = savedToken;
      _user = savedUser;
      _status = AuthStatus.authenticated;
      notifyListeners();
    } catch (_) {
      _token = null;
      _user = null;
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'Unable to restore session. Please log in again.';
      notifyListeners();
    }
  }

  Future<bool> login({required String email, required String password}) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authApiService.login(email: email, password: password);
      if (!response.success || response.token.isEmpty) {
        _status = AuthStatus.unauthenticated;
        _errorMessage = response.message.isEmpty ? 'Login failed.' : response.message;
        notifyListeners();
        return false;
      }

      _token = response.token;
      _user = response.user;
      await _secureStorage.saveSession(token: _token!, user: _user!);

      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } on AppException catch (error) {
      _token = null;
      _user = null;
      _status = AuthStatus.unauthenticated;
      _errorMessage = error.message;
      notifyListeners();
      return false;
    } catch (_) {
      _token = null;
      _user = null;
      _status = AuthStatus.unauthenticated;
      _errorMessage = 'Unexpected error occurred during login.';
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    _errorMessage = null;
    _status = AuthStatus.unauthenticated;
    await _secureStorage.clearSession();
    notifyListeners();
  }
}
