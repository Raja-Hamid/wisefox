import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/profile/data/datasources/profile_remote_data_source.dart';
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
}
