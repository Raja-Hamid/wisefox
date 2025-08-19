import 'package:equatable/equatable.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

enum ProfileScreenType { profile, editProfile, changePassword, settings }

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  final ProfileScreenType screenType;

  const ProfileLoading({required this.screenType});

  @override
  List<Object?> get props => [screenType];
}

class ProfileLoaded extends ProfileState {
  final ProfileEntity entity;
  final ProfileScreenType screenType;

  const ProfileLoaded({required this.entity, required this.screenType});

  @override
  List<Object?> get props => [entity, screenType];
}

class ProfileUpdated extends ProfileState {
  final String message;
  final ProfileEntity entity;
  final ProfileScreenType screenType;

  const ProfileUpdated({
    required this.message,
    required this.entity,
    required this.screenType,
  });

  @override
  List<Object?> get props => [message, entity, screenType];
}

class PasswordUpdated extends ProfileState {
  final String message;
  final ProfileScreenType screenType;

  const PasswordUpdated({required this.message, required this.screenType});

  @override
  List<Object?> get props => [message, screenType];
}

class ProfileSigningOut extends ProfileState {
  final ProfileScreenType screenType;

  const ProfileSigningOut({required this.screenType});

  @override
  List<Object?> get props => [screenType];
}

class ProfileSignedOut extends ProfileState {
  final String message;
  final ProfileScreenType screenType;

  const ProfileSignedOut({required this.message, required this.screenType});

  @override
  List<Object?> get props => [message, screenType];
}

class ProfileFailure extends ProfileState {
  final String error;
  final ProfileScreenType screenType;

  const ProfileFailure({required this.error, required this.screenType});

  @override
  List<Object?> get props => [error, screenType];
}
