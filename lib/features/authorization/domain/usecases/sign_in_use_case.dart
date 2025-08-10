import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/common/entities/user.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class SignInParams {
  final User user;
  final String password;

  SignInParams({required this.user, required this.password});
}

class SignInUseCase implements UseCase<String, SignInParams> {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignInParams params) {
    return repository.signIn(entity: params.user, password: params.password);
  }
}
