import 'package:wisefox/core/common/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
  });

  factory UserModel.fromSupabase({required Map<String, dynamic> userData}) {
    return UserModel(
      id: userData['id'] ?? '',
      email: userData['email'] ?? '',
      firstName: userData['first_name'] ?? '',
      lastName: userData['last_name'] ?? '',
    );
  }
}
