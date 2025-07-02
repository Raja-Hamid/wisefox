import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/authorization/data/models/auth_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUp({required AuthModel model});

  Future<String> signIn({required AuthModel model});

  Future<void> resetPassword({required AuthModel model});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<String> signIn({required AuthModel model}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: model.email,
        password: model.password!,
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
  Future<String> signUp({required AuthModel model}) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: model.email,
        password: model.password!,
        data: {
          'firstName': model.firstName,
          'lastName': model.lastName,
          'userName': model.userName,
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
  Future<void> resetPassword({required AuthModel model}) async {
    try {
      await supabaseClient.auth.resetPasswordForEmail(model.email!);
    } catch (e) {
      throw ServerException(message: 'Failed to reset password: $e');
    }
  }
}
