import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:wisefox/features/dashboard/data/models/income_model.dart';
import 'package:wisefox/features/dashboard/data/models/saving_model.dart';
import 'package:wisefox/features/dashboard/data/models/spending_model.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';
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
  Future<Either<Failure, String>> addIncome({
    required IncomeEntity entity,
  }) async {
    try {
      await remoteDataSource.addIncome(
        income: IncomeModel.fromEntity(entity: entity),
      );
      return Right('Income Added Successfully');
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

  @override
  Future<Either<Failure, String>> addSpending({
    required SpendingEntity entity,
  }) async {
    try {
      await remoteDataSource.addSpending(
        spending: SpendingModel.fromEntity(entity: entity),
      );
      return Right('Spending Added Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteIncome({
    required IncomeEntity entity,
  }) async {
    try {
      await remoteDataSource.deleteIncome(
        income: IncomeModel.fromEntity(entity: entity),
      );
      return Right('Income Deleted Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSaving({
    required SavingEntity entity,
  }) async {
    try {
      await remoteDataSource.deleteSaving(
        saving: SavingModel.fromEntity(entity: entity),
      );
      return Right('Saving Deleted Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteSpending({
    required SpendingEntity entity,
  }) async {
    try {
      await remoteDataSource.deleteSpending(
        spending: SpendingModel.fromEntity(entity: entity),
      );
      return Right('Spending Deleted Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<IncomeEntity>>> getIncomes() async {
    try {
      final incomes = await remoteDataSource.getIncomes();
      return Right(incomes);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<SavingEntity>>> getSavings() async {
    try {
      final savings = await remoteDataSource.getSavings();
      return Right(savings);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<SpendingEntity>>> getSpendings() async {
    try {
      final spendings = await remoteDataSource.getSpendings();
      return Right(spendings);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateIncome({
    required IncomeEntity entity,
  }) async {
    try {
      await remoteDataSource.updateIncome(
        income: IncomeModel.fromEntity(entity: entity),
      );
      return Right('Income Updated Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateSaving({
    required SavingEntity entity,
  }) async {
    try {
      await remoteDataSource.updateSaving(
        saving: SavingModel.fromEntity(entity: entity),
      );
      return Right('Saving Updated Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateSpending({
    required SpendingEntity entity,
  }) async {
    try {
      await remoteDataSource.updateSpending(
        spending: SpendingModel.fromEntity(entity: entity),
      );
      return Right('Spending Updated Successfully');
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
