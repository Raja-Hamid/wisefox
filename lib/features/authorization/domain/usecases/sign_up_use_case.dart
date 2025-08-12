import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class SignUpParams {
  final AuthEntity entity;
  final String password;

  SignUpParams({required this.entity, required this.password});
}

class SignUpUseCase implements UseCase<String, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignUpParams params) {
    return repository.signUp(entity: params.entity, password: params.password);
  }
}
