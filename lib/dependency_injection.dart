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

final di = GetIt.instance;

Future<void> init() async {
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
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

  di.registerFactory(() => AuthBloc(
    signUpUseCase: di(),
    signInUseCase: di(),
    resetPasswordUseCase: di(),
  ));
}
