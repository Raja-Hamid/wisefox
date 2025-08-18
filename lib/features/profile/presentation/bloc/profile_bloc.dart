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
    required this.updatePasswordUseCase,
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
    emit(ProfileLoading(screenType: ProfileScreenType.profile));
    final result = await signOutUseCase(NoParams());
    result.fold(
      (failure) => emit(
        ProfileFailure(
          error: failure.message,
          screenType: ProfileScreenType.profile,
        ),
      ),
      (success) => emit(
        ProfileSignedOut(
          message: 'Signed out Successfully!',
          screenType: ProfileScreenType.profile,
        ),
      ),
    );
  }

  Future<void> _onUpdatePasswordRequested(
    UpdatePasswordRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading(screenType: ProfileScreenType.changePassword));
    final result = await updatePasswordUseCase(event.entity);
    result.fold(
      (failure) => emit(
        ProfileFailure(
          error: failure.message,
          screenType: ProfileScreenType.changePassword,
        ),
      ),
      (success) => emit(
        PasswordUpdated(
          message: 'Password updated Successfully!',
          screenType: ProfileScreenType.changePassword,
        ),
      ),
    );
  }

  Future<void> _onUpdateProfileRequested(
    UpdateProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading(screenType: ProfileScreenType.editProfile));
    final result = await updateProfileUseCase(event.entity);

    await result.fold(
      (failure) async => emit(
        ProfileFailure(
          error: failure.message,
          screenType: ProfileScreenType.editProfile,
        ),
      ),
      (_) async {
        final refreshed = await fetchProfileDataUseCase(NoParams());
        refreshed.fold(
          (failure) => emit(
            ProfileFailure(
              error: failure.message,
              screenType: ProfileScreenType.editProfile,
            ),
          ),
          (success) => emit(
            ProfileUpdated(
              message: 'Profile updated successfully',
              entity: success,
              screenType: ProfileScreenType.editProfile,
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
    emit(ProfileLoading(screenType: ProfileScreenType.profile));
    final result = await fetchProfileDataUseCase(NoParams());
    result.fold(
      (failure) => emit(
        ProfileFailure(
          error: failure.message,
          screenType: ProfileScreenType.profile,
        ),
      ),
      (success) => emit(
        ProfileLoaded(entity: success, screenType: ProfileScreenType.profile),
      ),
    );
  }
}
