import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileEvent {}

class SignOutRequested extends ProfileEvent {
  SignOutRequested();
}

class FetchProfileDataRequested extends ProfileEvent {
  FetchProfileDataRequested();
}

class UpdateProfileRequested extends ProfileEvent {
  final ProfileEntity entity;

  UpdateProfileRequested({required this.entity});
}

class UpdatePasswordRequested extends ProfileEvent {
  final ProfileEntity entity;

  UpdatePasswordRequested({required this.entity});
}