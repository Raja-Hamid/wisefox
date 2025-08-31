import 'package:wisefox/core/common/entities/user_entity.dart';

class AuthEntity extends UserEntity {
  final String? password;

  const AuthEntity({
    super.id = '',
    required super.email,
    super.firstName = '',
    super.lastName = '',
    this.password,
  });
}
