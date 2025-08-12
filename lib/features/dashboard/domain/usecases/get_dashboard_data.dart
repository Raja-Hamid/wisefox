import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardDataUseCase implements UseCase<DashboardEntity, NoParams> {
  final DashboardRepository repository;

  GetDashboardDataUseCase({required this.repository});

  @override
  Future<Either<Failure, DashboardEntity>> call(NoParams params) {
    return repository.getDashboardData();
  }
}
