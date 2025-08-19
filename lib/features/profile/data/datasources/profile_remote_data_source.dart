import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/core/errors/failures.dart';
import 'package:wisefox/features/profile/data/models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ProfileModel> fetchProfileData();
  Future<void> updateProfile({required ProfileModel model});
  Future<void> updatePassword({required ProfileModel model});
  Future<void> signOut();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProfileRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<void> updateProfile({required ProfileModel model}) async {
    try {
      await supabaseClient
          .from('users')
          .update({'first_name': model.firstName, 'last_name': model.lastName})
          .eq('id', '${model.id}');
    } catch (e) {
      throw ServerException(message: 'Failed to update profile: $e');
    }
  }

  @override
  Future<void> updatePassword({required ProfileModel model}) async {
    if (model.password == null || model.password!.isEmpty) {
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
  Future<ProfileModel> fetchProfileData() async {
    try {
      final userId = supabaseClient.auth.currentUser!.id;
      final userResponse =
          await supabaseClient.from('users').select().eq('id', userId).single();
      return ProfileModel.fromSupabase(userData: userResponse);
    } catch (e) {
      throw ServerException(message: 'Failed to fetch profile data $e');
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
