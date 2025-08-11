import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/profile/data/models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<void> updateProfile({required ProfileModel model});
  Future<void> updatePassword({required ProfileModel model});
  Future<void> signOut();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProfileRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<void> updateProfile({required ProfileModel model}) async {
    try {} catch (e) {
      throw ServerException(message: 'Failed to update info: $e');
    }
  }

  @override
  Future<void> updatePassword({required ProfileModel model}) async {
    if (model.password.isEmpty) {
      throw ServerException(message: 'Password cannot be null or empty');
    }
    try {
      await supabaseClient.auth.updateUser(
        UserAttributes(password: model.password),
      );
    } catch (e) {
      throw ServerException(message: 'Failed to update password: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(message: 'Failed to sign out: $e');
    }
  }
}
