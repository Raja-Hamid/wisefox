import 'package:wisefox/core/common/entities/user_entity.dart';

class ProfileEntity extends UserEntity {
  final String? userName;
  final String? password;

  const ProfileEntity({
    super.id,
    super.email,
    this.userName,
    super.firstName,
    super.lastName,
    this.password,
  });

  ProfileEntity copyWith({
    String? id,
    String? email,
    String? userName,
    String? firstName,
    String? lastName,
    String? password,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }
}
