import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/core/secrets/app_secrets.dart';
import 'package:wisefox/features/authorization/data/datasources/auth_remote_data_source.dart';
import 'package:wisefox/features/authorization/data/repositories/auth_repository_impl.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';
import 'package:wisefox/features/authorization/domain/usecases/reset_password_use_case.dart';
import 'package:wisefox/features/authorization/domain/usecases/sign_in_use_case.dart';
import 'package:wisefox/features/authorization/domain/usecases/sign_up_use_case.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:wisefox/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:wisefox/features/dashboard/domain/usecases/get_dashboard_data.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:wisefox/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:wisefox/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:wisefox/features/profile/domain/repositories/profile_repository.dart';
import 'package:wisefox/features/profile/domain/usecases/fetch_profile_data_use_case.dart';
import 'package:wisefox/features/profile/domain/usecases/sign_out_use_case.dart';
import 'package:wisefox/features/profile/presentation/bloc/profile_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  // AUTH INJECTIONS
  di.registerLazySingleton(() => Supabase.instance.client);
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: di()),
  );
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: di()),
  );
  di.registerLazySingleton(() => SignUpUseCase(repository: di()));
  di.registerLazySingleton(() => SignInUseCase(repository: di()));
  di.registerLazySingleton(() => ResetPasswordUseCase(repository: di()));
  di.registerFactory(
    () => AuthBloc(
      signUpUseCase: di(),
      signInUseCase: di(),
      resetPasswordUseCase: di(),
    ),
  );

  // DASHBOARD INJECTIONS
  di.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(supabaseClient: di()),
  );
  di.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(remoteDataSource: di()),
  );
  di.registerLazySingleton(() => GetDashboardDataUseCase(repository: di()));
  di.registerFactory(() => DashboardBloc(getDashboardDataUseCase: di()));

  // PROFILE INJECTIONS
  di.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(supabaseClient: di()),
  );
  di.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(remoteDataSource: di()),
  );
  di.registerLazySingleton(() => SignOutUseCase(repository: di()));
  di.registerLazySingleton(() => FetchProfileDataUseCase(repository: di()));
  di.registerFactory(
    () => ProfileBloc(signOutUseCase: di(), fetchProfileDataUseCase: di()),
  );
}
