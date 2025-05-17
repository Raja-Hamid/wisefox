import 'package:wisefox/domain/entities/user.dart';

abstract class AuthRepo {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(
    String firstName,
    String lastName,
    String userID,
    String email,
    String password,
  );
  Future<void> signOut();
  Future<User?> currentUser();
}
