import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_user_model.freezed.dart';

@freezed
abstract class LocalUserModel with _$LocalUserModel {
  const factory LocalUserModel({
    required int id,
    required String email,
    required String password,
    required String role,
  }) = _LocalUserModel;

  factory LocalUserModel.fromMap(Map<String, dynamic> map) {
    return LocalUserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
    );
  }
}
