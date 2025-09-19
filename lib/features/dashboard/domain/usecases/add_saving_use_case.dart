import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/repositories/dashboard_repository.dart';

class AddSavingUseCase implements UseCase<String, SavingEntity> {
  final DashboardRepository repository;

  AddSavingUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(SavingEntity params) {
    return repository.addSaving(entity: params);
  }
}
