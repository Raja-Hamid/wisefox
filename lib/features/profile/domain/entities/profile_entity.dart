import 'package:wisefox/core/common/entities/user.dart';

class ProfileEntity extends User {
  final String userName;
  final String? password;

  const ProfileEntity({
    required super.id,
    required super.email,
    required this.userName,
    required super.firstName,
    required super.lastName,
    this.password,
  });
}
