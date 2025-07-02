import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';

abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final AuthEntity entity;
  SignUpRequested({required this.entity});
}

class SignInRequested extends AuthEvent {
  final AuthEntity entity;
  SignInRequested({required this.entity});
}

class ResetPasswordRequested extends AuthEvent {
  final AuthEntity entity;
  ResetPasswordRequested({required this.entity});
}
