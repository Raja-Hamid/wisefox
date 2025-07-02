import 'package:wisefox/core/common/entities/user.dart';

abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final User entity;
  SignUpRequested({required this.entity});
}

class SignInRequested extends AuthEvent {
  final User entity;
  SignInRequested({required this.entity});
}

class ResetPasswordRequested extends AuthEvent {
  final User entity;
  ResetPasswordRequested({required this.entity});
}
