import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileEntity entity;
  final String? message;

  ProfileSuccess({required this.entity, this.message});
}

class ProfileSignedOut extends ProfileState {}

class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure(this.error);
}
