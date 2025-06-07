import 'package:wisefox/features/dashboard/domain/entities/user.dart';

abstract class AuthRepo {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
  );
  Future<void> signOut();
  Future<User?> currentUser();
}
