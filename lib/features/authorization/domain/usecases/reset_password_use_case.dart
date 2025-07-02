import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/common/entities/user.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase implements UseCase<String, User>{
  final AuthRepository repository;

  ResetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(User entity) {
    return repository.resetPassword(entity: entity);
  }
}