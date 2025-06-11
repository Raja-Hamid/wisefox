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
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await signUpUseCase(event.entity);
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (userId) => emit(AuthSuccess("Signed up: $userId")),
      );
    });

    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await signInUseCase(event.entity);
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (userId) => emit(AuthSuccess("Signed in: $userId")),
      );
    });

    on<ResetPasswordRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await resetPasswordUseCase(event.entity);
      result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (_) => emit(AuthSuccess("Reset link sent")),
      );
    });
  }
}
