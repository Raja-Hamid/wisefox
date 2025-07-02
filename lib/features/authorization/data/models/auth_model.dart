import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    super.firstName,
    super.lastName,
    super.userName,
    super.email,
    super.password,
  });

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      userName: entity.userName,
      email: entity.email,
      password: entity.password,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      email: email,
      password: password,
    );
  }
}
