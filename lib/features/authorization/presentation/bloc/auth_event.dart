import 'package:wisefox/core/common/entities/user.dart';

abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final User entity;
  final String password;
  SignUpRequested({required this.entity, required this.password});
}

class SignInRequested extends AuthEvent {
  final User entity;
  final String password;
  SignInRequested({required this.entity, required this.password});
}

class ResetPasswordRequested extends AuthEvent {
  final User entity;
  ResetPasswordRequested({required this.entity});
}
