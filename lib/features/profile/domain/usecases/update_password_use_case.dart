import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';
import 'package:wisefox/features/profile/domain/repositories/profile_repository.dart';

class UpdatePasswordUseCase implements UseCase<String, ProfileEntity> {
  final ProfileRepository repository;

  UpdatePasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ProfileEntity params) {
    return repository.updatePassword(entity: params);
  }
}
