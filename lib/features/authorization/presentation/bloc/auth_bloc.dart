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

  void resetState() {
    emit(AuthInitial());
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(screenType: AuthScreenType.signUp));
    final result = await signUpUseCase(
      SignUpParams(entity: event.entity, password: event.password),
    );
    result.fold(
      (failure) => emit(
        AuthFailure(error: failure.message, screenType: AuthScreenType.signUp),
      ),
      (user) => emit(
        Authenticated(
          user: 'Signed up: $user',
          screenType: AuthScreenType.signUp,
        ),
      ),
    );
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(screenType: AuthScreenType.signIn));
    final result = await signInUseCase(
      SignInParams(entity: event.entity, password: event.password),
    );
    result.fold(
      (failure) => emit(
        AuthFailure(error: failure.message, screenType: AuthScreenType.signIn),
      ),
      (user) => emit(
        Authenticated(
          user: "Signed in: $user",
          screenType: AuthScreenType.signIn,
        ),
      ),
    );
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(screenType: AuthScreenType.resetPassword));
    final result = await resetPasswordUseCase(event.entity);
    result.fold(
      (failure) => emit(
        AuthFailure(
          error: failure.message,
          screenType: AuthScreenType.resetPassword,
        ),
      ),
      (email) => emit(AuthPasswordReset(email: 'Reset link sent to : $email')),
    );
  }
}
