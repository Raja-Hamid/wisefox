import 'package:wisefox/core/common/entities/user.dart';

class AuthModel extends User {
  const AuthModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  factory AuthModel.fromEntity(User entity) {
    return AuthModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
    );
  }

  User toEntity() {
    return User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
