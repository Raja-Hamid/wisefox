import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<String, SignInEntity> {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignInEntity entity) {
    return repository.signIn(entity: entity);
  }
}