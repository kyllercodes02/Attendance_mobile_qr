import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

class LoginAdminUseCase {
  const LoginAdminUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthUser?> call({
    required String email,
    required String password,
  }) {
    return _repository.loginAdmin(email: email, password: password);
  }
}
