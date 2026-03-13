import '../../domain/entities/authenticated_user.dart';

class LoginResponseModel {
  const LoginResponseModel({
    required this.success,
    required this.message,
    required this.tokenType,
    required this.token,
    required this.user,
  });

  final bool success;
  final String message;
  final String tokenType;
  final String token;
  final AuthenticatedUser user;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'];
    if (userData is! Map<String, dynamic>) {
      throw const FormatException('Invalid login response: missing user object.');
    }

    return LoginResponseModel(
      success: json['success'] == true,
      message: (json['message'] as String? ?? '').trim(),
      tokenType: (json['token_type'] as String? ?? '').trim(),
      token: (json['token'] as String? ?? '').trim(),
      user: AuthenticatedUser.fromJson(userData),
    );
  }
}
