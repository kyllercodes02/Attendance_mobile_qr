import '../../../../core/database/app_database.dart';
import '../models/local_user_model.dart';

class AuthLocalDataSource {
  const AuthLocalDataSource(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<LocalUserModel?> authenticateAdmin({
    required String email,
    required String password,
  }) async {
    final db = await _appDatabase.database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ? AND role = ?',
      whereArgs: [email.trim(), password, 'admin'],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return LocalUserModel.fromMap(result.first);
  }
}
