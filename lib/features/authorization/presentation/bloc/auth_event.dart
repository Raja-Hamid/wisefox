import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';

abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final AuthEntity entity;
  final String password;
  SignUpRequested({required this.entity, required this.password});
}

class SignInRequested extends AuthEvent {
  final AuthEntity entity;
  final String password;
  SignInRequested({required this.entity, required this.password});
}

class ResetPasswordRequested extends AuthEvent {
  final AuthEntity entity;
  ResetPasswordRequested({required this.entity});
}
