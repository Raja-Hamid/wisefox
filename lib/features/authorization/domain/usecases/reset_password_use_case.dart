import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/authorization/domain/entities/reset_password_entity.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<String, ResetPasswordEntity>{
  final AuthRepository repository;

  ResetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ResetPasswordEntity entity) {
    return repository.resetPassword(entity: entity);
  }
}