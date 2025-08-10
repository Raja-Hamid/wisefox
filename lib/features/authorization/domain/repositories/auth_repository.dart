import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/common/entities/user.dart';
import 'package:wisefox/core/errors/exceptions.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp({
    required User entity,
    required String password,
  });
  Future<Either<Failure, String>> signIn({
    required User entity,
    required String password,
  });
  Future<Either<Failure, String>> resetPassword({required User entity});
}
