import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileEvent {}

class SignOutRequested extends ProfileEvent {}

class FetchProfileDataRequested extends ProfileEvent {}

class UpdateProfileRequested extends ProfileEvent {
  final ProfileEntity entity;

  UpdateProfileRequested({required this.entity});
}

class UpdatePasswordRequested extends ProfileEvent {
  final ProfileEntity entity;

  UpdatePasswordRequested({required this.entity});
}
