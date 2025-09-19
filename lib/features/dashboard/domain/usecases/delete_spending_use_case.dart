import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class DeleteSpendingUseCase implements UseCase<String, SpendingEntity> {
  final DashboardRepository repository;

  DeleteSpendingUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SpendingEntity params) {
    return repository.deleteSpending(entity: params);
  }
}
