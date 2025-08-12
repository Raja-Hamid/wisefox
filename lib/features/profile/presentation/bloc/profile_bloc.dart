import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/fetch_profile_data_use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/sign_out_use_case.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SignOutUseCase signOutUseCase;
  final FetchProfileDataUseCase fetchProfileDataUseCase;

  ProfileBloc({
    required this.signOutUseCase,
    required this.fetchProfileDataUseCase,
  }) : super(ProfileInitial()) {
    on<SignOutRequested>(_onSignOutRequested);
    on<FetchProfileDataRequested>(_onFetchProfileDataRequested);
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await signOutUseCase(NoParams());
    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (success) => emit(ProfileSignedOut()),
    );
  }

  Future<void> _onFetchProfileDataRequested(
    FetchProfileDataRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await fetchProfileDataUseCase(NoParams());
    result.fold(
      (failure) => emit(ProfileFailure(failure.message)),
      (profileData) => emit(ProfileSuccess(profileData)),
    );
  }
}
