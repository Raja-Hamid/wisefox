import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:wisefox/features/dashboard/data/models/saving_model.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, DashboardEntity>> getDashboardData() async {
    try {
      final data = await remoteDataSource.getDashboardData();
      return Right(data);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> addSaving({
    required SavingEntity entity,
  }) async {
    try {
      await remoteDataSource.addSaving(
        saving: SavingModel.fromEntity(entity: entity),
      );
      return Right('Saving Added Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
