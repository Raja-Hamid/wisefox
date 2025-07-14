import 'package:wisefox/features/dashboard/data/models/profile_model.dart';

abstract interface class ProfileRemoteDataSource{
  Future<ProfileModel> fetchProfile({required ProfileModel model});
}