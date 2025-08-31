import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboardData();
  Future<Either<Failure, String>> addSaving({required SavingEntity entity});
}
