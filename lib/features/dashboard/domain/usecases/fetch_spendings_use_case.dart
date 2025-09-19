import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class FetchSpendingsUseCase implements UseCase<List<SpendingEntity>, NoParams> {
  final DashboardRepository repository;

  FetchSpendingsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SpendingEntity>>> call(NoParams params) {
    return repository.getSpendings();
  }
}
