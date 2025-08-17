import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  final String? action;
  ProfileLoading({this.action});
}

class ProfileLoaded extends ProfileState {
  final ProfileEntity entity;
  ProfileLoaded({required this.entity});
}

class ProfileUpdated extends ProfileState {
  final ProfileEntity entity;
  final String message;
  ProfileUpdated({required this.entity, required this.message});
}

class PasswordUpdated extends ProfileState {
  final String message;
  PasswordUpdated({required this.message});
}

class ProfileSignedOut extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String error;
  ProfileFailure(this.error);
}
