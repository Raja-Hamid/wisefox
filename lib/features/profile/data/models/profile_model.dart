import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.email,
    required super.userName,
    required super.firstName,
    required super.lastName,
    super.password,
  });

  factory ProfileModel.fromSupabase({required Map<String, dynamic> userData}) {
    return ProfileModel(
      id: userData['id'] ?? '',
      userName: '${userData['first_name']} ${userData['last_name']}',
      firstName: userData['first_name'] ?? '',
      lastName: userData['last_name'] ?? '',
      email: userData['email'] ?? '',
    );
  }

  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      userName: entity.userName,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
    );
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
