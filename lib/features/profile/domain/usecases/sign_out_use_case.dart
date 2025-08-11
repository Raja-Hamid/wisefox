import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/profile/domain/repositories/profile_repository.dart';

class SignOutUseCase implements UseCase<String, NoParams> {
  final ProfileRepository repository;

  SignOutUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return repository.signOut();
  }
}
