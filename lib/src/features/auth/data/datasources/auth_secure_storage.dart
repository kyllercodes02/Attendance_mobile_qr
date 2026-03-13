import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/authenticated_user.dart';

class AuthSecureStorage {
  AuthSecureStorage(this._storage);

  static const _tokenKey = 'auth_token';
  static const _userKey = 'auth_user';

  final FlutterSecureStorage _storage;

  Future<void> saveSession({
    required String token,
    required AuthenticatedUser user,
  }) async {
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  Future<String?> readToken() {
    return _storage.read(key: _tokenKey);
  }

  Future<AuthenticatedUser?> readUser() async {
    final jsonRaw = await _storage.read(key: _userKey);
    if (jsonRaw == null || jsonRaw.trim().isEmpty) {
      return null;
    }

    final decoded = jsonDecode(jsonRaw);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }

    return AuthenticatedUser.fromJson(decoded);
  }

  Future<void> clearSession() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userKey);
  }
}
