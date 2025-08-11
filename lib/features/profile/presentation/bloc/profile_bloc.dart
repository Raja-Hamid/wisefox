import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/sign_out_use_case.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SignOutUseCase signOutUseCase;

  ProfileBloc({required this.signOutUseCase}) : super(ProfileInitial()) {
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await signOutUseCase(NoParams());
    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (success) => emit(ProfileSuccess('Signed Out Successfully')),
    );
  }
}
