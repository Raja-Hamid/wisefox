import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/authorization/data/datasources/auth_remote_data_source.dart';
import 'package:wisefox/features/authorization/data/models/auth_model.dart';
import 'package:wisefox/features/authorization/domain/entities/auth_entity.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> signUp({required AuthEntity entity}) async {
    try {
      final model = AuthModel.fromEntity(entity);
      final userID = await remoteDataSource.signUp(
        firstName: model.firstName!,
        lastName: model.lastName!,
        userName: model.userName!,
        email: model.email!,
        password: model.password!,
      );
      return Right(userID);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signIn({required AuthEntity entity}) async {
    try {
      final model = AuthModel.fromEntity(entity);
      final userID = await remoteDataSource.signIn(
        email: model.email!,
        password: model.password!,
      );
      return Right(userID);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required AuthEntity entity,
  }) async {
    try {
      final model = AuthModel.fromEntity(entity);
      await remoteDataSource.resetPassword(email: model.email!);
      return Right('Password Reset Successful');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
