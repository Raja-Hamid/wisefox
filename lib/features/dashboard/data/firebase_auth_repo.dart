import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:wisefox/features/dashboard/domain/entities/user.dart';
import 'package:wisefox/features/dashboard/domain/repositories/auth_repo.dart';



class FirebaseAuthRepo extends AuthRepo {
  final fb_auth.FirebaseAuth _firebaseAuth = fb_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<User?> signUp(
    String firstName,
    String lastName,
    String userName,
    String email,
    String password,
  ) async {
    try {
      final fb_auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final fb_auth.User? firebaseUser = userCredential.user;
      if (firebaseUser == null) return null;

      final userDoc = {
        'userName': userName,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };

      await _firestore.collection('user').doc(firebaseUser.uid).set(userDoc);

      return User(
        userName: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
    } on fb_auth.FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

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
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
