import 'package:equatable/equatable.dart';

enum AuthScreenType { signIn, signUp, resetPassword }

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final AuthScreenType screenType;

  const AuthLoading({required this.screenType});

  @override
  List<Object?> get props => [screenType];
}

class Authenticated extends AuthState {
  final String user;
  final AuthScreenType screenType;

  const Authenticated({required this.user, required this.screenType});

  @override
  List<Object?> get props => [user, screenType];
}

class Unauthenticated extends AuthState {}

class AuthPasswordReset extends AuthState {
  final String email;

  const AuthPasswordReset({required this.email});

  @override
  List<Object?> get props => [email];
}

class AuthFailure extends AuthState {
  final String error;
  final AuthScreenType screenType;

  const AuthFailure({required this.error, required this.screenType});

  @override
  List<Object?> get props => [error, screenType];
}
