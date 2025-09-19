import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class DeleteIncomeUseCase implements UseCase<String, IncomeEntity> {
  final DashboardRepository repository;

  DeleteIncomeUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(IncomeEntity params) {
    return repository.deleteIncome(entity: params);
  }
}
