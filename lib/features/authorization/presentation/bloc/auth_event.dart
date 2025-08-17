import 'package:equatable/equatable.dart';
import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends AuthEvent {
  final AuthEntity entity;
  final String password;

  SignUpRequested({required this.entity, required this.password});

  @override
  List<Object> get props => [entity, password];
}

class SignInRequested extends AuthEvent {
  final AuthEntity entity;
  final String password;

  SignInRequested({required this.entity, required this.password});

  @override
  List<Object> get props => [entity, password];
}

class ResetPasswordRequested extends AuthEvent {
  final AuthEntity entity;

  ResetPasswordRequested({required this.entity});

  @override
  List<Object> get props => [entity];
}
