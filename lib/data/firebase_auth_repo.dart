import 'package:wisefox/domain/entities/user.dart';
import 'package:wisefox/domain/repositories/auth_repo.dart';

class FirebaseAuthRepo extends AuthRepo {
  @override
  Future<User?> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<User?> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<User?> signUp(
    String firstName,
    String lastName,
    String userID,
    String email,
    String password,
  ) async {}
}
