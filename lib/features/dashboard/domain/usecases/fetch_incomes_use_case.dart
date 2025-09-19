import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class FetchIncomeUseCase implements UseCase<List<IncomeEntity>, NoParams> {
  final DashboardRepository repository;

  FetchIncomeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<IncomeEntity>>> call(NoParams params) {
    return repository.getIncomes();
  }
}
