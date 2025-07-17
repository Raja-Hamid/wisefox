import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/features/dashboard/data/models/dashboard_model.dart';

abstract interface class DashboardRemoteDataSource {
  Future<DashboardModel> getDashboardData();
}

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  final SupabaseClient supabaseClient;

  DashboardRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<DashboardModel> getDashboardData() async {
    final userId = supabaseClient.auth.currentUser!.id;

    final userResponse =
        await supabaseClient.from('users').select().eq('id', userId).single();

    final transactionsResponse = await supabaseClient
        .from('transactions')
        .select()
        .eq('user_id', userId);

    return DashboardModel.fromSupabase(
      userData: userResponse,
      transactionsData: transactionsResponse,
    );
  }
}