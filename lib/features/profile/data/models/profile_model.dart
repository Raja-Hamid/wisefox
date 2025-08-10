import 'package:wisefox/core/common/entities/user.dart';

class ProfileModel extends User {
  final String password;

  const ProfileModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required this.password,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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

  factory ProfileModel.fromEntity(User entity, String password) {
    return ProfileModel(
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
