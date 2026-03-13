import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../mappers/auth_user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._localDataSource);

  final AuthLocalDataSource _localDataSource;

  @override
  Future<AuthUser?> loginAdmin({
    required String email,
    required String password,
  }) async {
    final user = await _localDataSource.authenticateAdmin(
      email: email,
      password: password,
    );

    return user?.toEntity();
  }
}
