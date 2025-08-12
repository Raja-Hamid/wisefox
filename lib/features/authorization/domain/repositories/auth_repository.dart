import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp({
    required AuthEntity entity,
    required String password,
  });
  Future<Either<Failure, String>> signIn({
    required AuthEntity entity,
    required String password,
  });
  Future<Either<Failure, String>> resetPassword({required AuthEntity entity});
}
