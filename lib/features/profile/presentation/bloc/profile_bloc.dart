import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/fetch_profile_data_use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/sign_out_use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/update_password_use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/update_profile_use_case.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_event.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SignOutUseCase signOutUseCase;
  final FetchProfileDataUseCase fetchProfileDataUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;

  ProfileBloc({
    required this.signOutUseCase,
    required this.fetchProfileDataUseCase,
    required this.updateProfileUseCase,
    required this.updatePasswordUseCase
  }) : super(ProfileInitial()) {
    on<SignOutRequested>(_onSignOutRequested);
    on<FetchProfileDataRequested>(_onFetchProfileDataRequested);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<UpdatePasswordRequested>(_onUpdatePasswordRequested);
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

  Future<void> _onUpdatePasswordRequested(UpdatePasswordRequested event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await updatePasswordUseCase(event.entity);
    result.fold(
          (failure) => emit(ProfileFailure(failure.message)),
          (success) => emit(ProfileSignedOut()),
    );
  }

  Future<void> _onUpdateProfileRequested(
    UpdateProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final result = await updateProfileUseCase(event.entity);

    await result.fold(
      (failure) async => emit(ProfileFailure(failure.message)),
      (_) async {
        final refreshed = await fetchProfileDataUseCase(NoParams());

        refreshed.fold(
          (failure) => emit(ProfileFailure(failure.message)),
          (profile) => emit(
            ProfileSuccess(
              entity: profile,
              message: 'Profile updated successfully',
            ),
          ),
        );
      },
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
      (profileData) => emit(ProfileSuccess(entity: profileData, message: null)),
    );
  }

}
