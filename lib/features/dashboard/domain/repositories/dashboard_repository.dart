import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboardData();
}
