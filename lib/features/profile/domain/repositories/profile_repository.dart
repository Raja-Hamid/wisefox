import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';
import 'package:wisefox/features/profile/domain/entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> fetchProfileData();
  Future<Either<Failure, String>> updateProfile({
    required ProfileEntity entity,
  });
  Future<Either<Failure, String>> updatePassword({
    required ProfileEntity entity,
  });
  Future<Either<Failure, String>> signOut();
}
