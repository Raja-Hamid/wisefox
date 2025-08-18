import 'package:equatable/equatable.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignOutRequested extends ProfileEvent {}

class FetchProfileDataRequested extends ProfileEvent {}

class UpdateProfileRequested extends ProfileEvent {
  final ProfileEntity entity;

  UpdateProfileRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class UpdatePasswordRequested extends ProfileEvent {
  final ProfileEntity entity;

  UpdatePasswordRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}
