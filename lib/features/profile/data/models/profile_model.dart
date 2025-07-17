import 'package:wisefox/core/common/entities/user.dart';

class ProfileModel extends User {
  const ProfileModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
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

  factory ProfileModel.fromEntity(User entity) {
    return ProfileModel(
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
