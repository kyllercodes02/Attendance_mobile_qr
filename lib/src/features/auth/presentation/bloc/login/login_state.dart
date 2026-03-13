import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/auth_user.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(AuthUser user) = _Success;
  const factory LoginState.failure(String message) = _Failure;
}
