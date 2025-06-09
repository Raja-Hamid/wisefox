import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/authorization/data/datasources/auth_remote_data_source.dart';
import 'package:wisefox/features/authorization/domain/entities/reset_password_entity.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_in_entity.dart';
import 'package:wisefox/features/authorization/domain/entities/sign_up_entity.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> resetPassword({
    required ResetPasswordEntity entity,
  }) async {
    try {
      await remoteDataSource.resetPassword(email: entity.email);
      return Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signIn({required SignInEntity entity}) async {
    try {
      final userID = await remoteDataSource.signIn(
        email: entity.email,
        password: entity.password,
      );
      return Right(userID);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUp({required SignUpEntity entity}) async {
    try {
      final userID = await remoteDataSource.signUp(
        firstName: entity.firstName,
        lastName: entity.lastName,
        userName: entity.userName,
        email: entity.email,
        password: entity.password,
      );
      return Right(userID);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
