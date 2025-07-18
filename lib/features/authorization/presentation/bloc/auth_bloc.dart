import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/features/authorization/domain/usecases/reset_password_use_case.dart';
import 'package:wisefox/features/authorization/domain/usecases/sign_in_use_case.dart';
import 'package:wisefox/features/authorization/domain/usecases/sign_up_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthBloc({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
    on<SignInRequested>(_onSignInRequested);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signUpUseCase(event.entity);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userId) => emit(AuthSuccess("Signed up: $userId")),
    );
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signInUseCase(event.entity);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userId) => emit(AuthSuccess("Signed in: $userId")),
    );
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await resetPasswordUseCase(event.entity);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthSuccess("Reset link sent")),
    );
  }
}
