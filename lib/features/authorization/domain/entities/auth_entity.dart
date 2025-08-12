import 'package:wisefox/core/common/entities/user.dart';

class AuthEntity extends User {
  final String? password;

  const AuthEntity({
    super.id = '',
    required super.email,
    super.firstName = '',
    super.lastName = '',
    this.password,
  });
}
