import 'package:fpdart/fpdart.dart';
import 'package:wisefox/core/errors/exceptions.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> signOut();
}
