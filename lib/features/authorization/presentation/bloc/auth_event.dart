import 'package:wisefox/features/authorization/domain/entities/reset_password_entity.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_up_entity.dart';

abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final SignUpEntity entity;
  SignUpRequested({required this.entity});
}

class SignInRequested extends AuthEvent {
  final SignInEntity entity;
  SignInRequested({required this.entity});
}

class ResetPasswordRequested extends AuthEvent {
  final ResetPasswordEntity entity;
  ResetPasswordRequested({required this.entity});
}
