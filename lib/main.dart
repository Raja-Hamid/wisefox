import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/core/secrets/app_secrets.dart';
import 'package:wisefox/features/authorization/data/datasources/auth_remote_data_source.dart';
import 'package:wisefox/features/authorization/data/repositories/auth_repository_impl.dart';
import 'package:wisefox/features/authorization/domain/usecases/reset_password_use_case.dart';
import 'package:wisefox/features/authorization/domain/usecases/sign_in_use_case.dart';
import 'package:wisefox/features/authorization/domain/usecases/sign_up_use_case.dart';
import 'package:wisefox/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:wisefox/features/onboarding/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = AuthRemoteDataSourceImpl(
      supabaseClient: Supabase.instance.client,
    );
    final authRepository = AuthRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    final signUpUseCase = SignUpUseCase(repository: authRepository);
    final signInUseCase = SignInUseCase(repository: authRepository);
    final resetPasswordUseCase = ResetPasswordUseCase(
      repository: authRepository,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create:
              (_) => AuthBloc(
                signUpUseCase: signUpUseCase,
                signInUseCase: signInUseCase,
                resetPasswordUseCase: resetPasswordUseCase,
              ),
        ),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(fontFamily: 'Plus Jakarta Sans'),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
