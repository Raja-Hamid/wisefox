import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/core/errors/failures.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
  });

  Future<String> signIn({required String email, required String password});

  Future<void> resetPassword({required String email});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(message: 'Failed to Sign In: $e');
    }
  }

  @override
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'userName': userName,
        },
      );
      if (response.user == null) {
        throw ServerException(message: 'User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(message: 'Failed to Sign Up: $e');
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await supabaseClient.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw ServerException(message: 'Failed to reset password: $e');
    }
  }
}
