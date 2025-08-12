import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:wisefox/features/profile/data/models/profile_model.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';
import 'package:wisefox/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return Right('Signed Out Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> fetchProfileData() async {
    try {
      final profileData = await remoteDataSource.fetchProfileData();
      return Right(profileData);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updatePassword({
    required ProfileEntity entity,
  }) async {
    try {
      await remoteDataSource.updatePassword(
        model: ProfileModel.fromEntity(entity),
      );
      return Right('Updated Password Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfile({
    required ProfileEntity entity,
  }) async {
    try {
      await remoteDataSource.updateProfile(
        model: ProfileModel.fromEntity(entity),
      );
      return Right('Updated Profile Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
