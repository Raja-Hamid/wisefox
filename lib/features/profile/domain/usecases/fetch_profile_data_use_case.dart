import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';
import 'package:wisefox/features/profile/domain/repositories/profile_repository.dart';

class FetchProfileDataUseCase implements UseCase<ProfileEntity, NoParams> {
  final ProfileRepository repository;

  FetchProfileDataUseCase({required this.repository});

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) {
    return repository.fetchProfileData();
  }
}
