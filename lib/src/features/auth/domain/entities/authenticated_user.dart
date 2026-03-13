class AuthenticatedUser {
  const AuthenticatedUser({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.roles,
    required this.primaryRole,
  });

  final int id;
  final String name;
  final String email;
  final bool isAdmin;
  final List<String> roles;
  final String primaryRole;

  bool get isTeacher => primaryRole.toLowerCase() == 'teacher';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'is_admin': isAdmin,
      'roles': roles,
      'primary_role': primaryRole,
    };
  }

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) {
    final rolesValue = json['roles'];
    return AuthenticatedUser(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String? ?? '').trim(),
      email: (json['email'] as String? ?? '').trim(),
      isAdmin: json['is_admin'] == true,
      roles: rolesValue is List
          ? rolesValue
                .whereType<Object>()
                .map((item) => item.toString())
                .toList(growable: false)
          : const <String>[],
      primaryRole: (json['primary_role'] as String? ?? '').trim(),
    );
  }
}
