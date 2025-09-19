import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class AddSpendingUseCase implements UseCase<String, SpendingEntity> {
  final DashboardRepository repository;

  AddSpendingUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SpendingEntity params) {
    return repository.addSpending(entity: params);
  }
}
