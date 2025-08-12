import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    super.password,
  });

  factory AuthModel.fromSupabase(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toSupabase() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };
  }

  factory AuthModel.fromEntity(AuthEntity entity, String? password) {
    return AuthModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: password,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
