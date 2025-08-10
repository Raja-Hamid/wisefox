import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/common/entities/user.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/authorization/data/datasources/auth_remote_data_source.dart';
import 'package:wisefox/features/authorization/data/models/auth_model.dart';
import 'package:wisefox/features/authorization/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> signUp({
    required User entity,
    required String password,
  }) async {
    try {
      final model = AuthModel.fromEntity(entity, password);
      final userID = await remoteDataSource.signUp(model: model);
      return Right(userID);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signIn({
    required User entity,
    required String password,
  }) async {
    try {
      final model = AuthModel.fromEntity(entity, password);
      final userID = await remoteDataSource.signIn(model: model);
      return Right(userID);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword({required User entity}) async {
    try {
      final model = AuthModel.fromEntity(entity, null);
      await remoteDataSource.resetPassword(model: model);
      return Right('Password Reset Successful');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
