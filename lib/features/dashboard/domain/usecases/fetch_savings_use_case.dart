import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class FetchSavingsUseCase implements UseCase<List<SavingEntity>, NoParams> {
  final DashboardRepository repository;

  FetchSavingsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<SavingEntity>>> call(NoParams params) {
    return repository.getSavings();
  }
}
