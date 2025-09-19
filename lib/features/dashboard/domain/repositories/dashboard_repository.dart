import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboardData();

  //SAVINGS
  Future<Either<Failure, List<SavingEntity>>> getSavings();
  Future<Either<Failure, String>> addSaving({required SavingEntity entity});
  Future<Either<Failure, String>> updateSaving({required SavingEntity entity});
  Future<Either<Failure, String>> deleteSaving({required SavingEntity entity});

  //SPENDINGS
  Future<Either<Failure, List<SpendingEntity>>> getSpendings();
  Future<Either<Failure, String>> addSpending({required SpendingEntity entity});
  Future<Either<Failure, String>> updateSpending({
    required SpendingEntity entity,
  });
  Future<Either<Failure, String>> deleteSpending({
    required SpendingEntity entity,
  });

  //INCOMES
  Future<Either<Failure, List<IncomeEntity>>> getIncomes();
  Future<Either<Failure, String>> addIncome({required IncomeEntity entity});
  Future<Either<Failure, String>> updateIncome({required IncomeEntity entity});
  Future<Either<Failure, String>> deleteIncome({required IncomeEntity entity});
}
