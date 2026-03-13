import '../entities/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser?> loginAdmin({
    required String email,
    required String password,
  });
}
