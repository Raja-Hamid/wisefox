import 'package:wisefox/core/common/entities/user.dart';

class AuthModel extends User {
  final String? password;

  const AuthModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  factory AuthModel.fromEntity(User entity, String? password) {
    return AuthModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: password,
    );
  }

  User toEntity() {
    return User(id: id, firstName: firstName, lastName: lastName, email: email);
  }
}
