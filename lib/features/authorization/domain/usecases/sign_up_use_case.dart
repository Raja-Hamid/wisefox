import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<String, SignUpEntity> {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SignUpEntity entity) {
    return repository.signUp(entity: entity);
  }
}