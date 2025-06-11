import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/features/authorization/domain/entities/reset_password_entity.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_up_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp({required SignUpEntity entity});
  Future<Either<Failure, String>> signIn({required SignInEntity entity});
  Future<Either<Failure, String>> resetPassword({
    required ResetPasswordEntity entity,
  });
}
