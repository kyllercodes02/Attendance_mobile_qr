import '../../domain/entities/auth_user.dart';
import '../models/local_user_model.dart';

extension LocalUserModelMapper on LocalUserModel {
  AuthUser toEntity() {
    return AuthUser(id: id, email: email, role: role);
  }
}
