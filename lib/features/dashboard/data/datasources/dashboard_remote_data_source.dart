import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wisefox/features/dashboard/data/models/dashboard_model.dart';
import 'package:wisefox/features/dashboard/data/models/income_model.dart';
import 'package:wisefox/features/dashboard/data/models/saving_model.dart';
import 'package:wisefox/features/dashboard/data/models/spending_model.dart';

abstract interface class DashboardRemoteDataSource {
  Future<DashboardModel> getDashboardData();

  //SAVINGS
  Future<List<SavingModel>> getSavings();
  Future<void> addSaving({required SavingModel saving});
  Future<void> updateSaving({required SavingModel saving});
  Future<void> deleteSaving({required SavingModel saving});

  //SPENDINGS
  Future<List<SpendingModel>> getSpendings();
  Future<void> addSpending({required SpendingModel spending});
  Future<void> updateSpending({required SpendingModel spending});
  Future<void> deleteSpending({required SpendingModel spending});

  //INCOMES
  Future<List<IncomeModel>> getIncomes();
  Future<void> addIncome({required IncomeModel income});
  Future<void> updateIncome({required IncomeModel income});
  Future<void> deleteIncome({required IncomeModel income});
}

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  final SupabaseClient supabaseClient;

  DashboardRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<DashboardModel> getDashboardData() async {
    final userID = supabaseClient.auth.currentUser!.id;

    final userData =
        await supabaseClient.from('users').select().eq('id', userID).single();

    final incomeData = await supabaseClient
        .from('incomes')
        .select()
        .eq('user_id', userID);

    final spendingData = await supabaseClient
        .from('spendings')
        .select()
        .eq('user_id', userID);

    final savingData = await supabaseClient
        .from('savings')
        .select()
        .eq('user_id', userID);

    return DashboardModel.fromSupabase(
      userData: userData,
      incomeData: incomeData,
      spendingData: spendingData,
      savingData: savingData,
    );
  }

  @override
  Future<void> addIncome({required IncomeModel income}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient.from('incomes').insert({
      'user_id': userID,
      'type': income.type,
      'amount': income.amount,
      'date': income.date,
    });
  }

  @override
  Future<void> addSaving({required SavingModel saving}) async {
    final userID = supabaseClient.auth.currentUser!.id;

    await supabaseClient.from('savings').insert({
      'user_id': userID,
      'category': saving.category,
      'description': saving.description,
      'total_amount': saving.totalAmount,
      'saved_amount': saving.savedAmount,
      'duration': saving.duration,
    });
  }

  @override
  Future<void> addSpending({required SpendingModel spending}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient.from('spendings').insert({
      'user_id': userID,
      'category': spending.category,
      'description': spending.description,
      'amount': spending.amount,
      'date': spending.date,
    });
  }

  @override
  Future<void> deleteIncome({required IncomeModel income}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient
        .from('incomes')
        .delete()
        .eq('id', income.id)
        .eq('user_id', userID);
  }

  @override
  Future<void> deleteSaving({required SavingModel saving}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient
        .from('savings')
        .delete()
        .eq('id', saving.id)
        .eq('user_id', userID);
  }

  @override
  Future<void> deleteSpending({required SpendingModel spending}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient
        .from('spendings')
        .delete()
        .eq('id', spending.id)
        .eq('user_id', userID);
  }

  @override
  Future<List<IncomeModel>> getIncomes() async {
    final userID = supabaseClient.auth.currentUser!.id;
    final incomeData = await supabaseClient
        .from('incomes')
        .select()
        .eq('user_id', userID);

    return incomeData
        .map<IncomeModel>(
          (incomes) => IncomeModel.fromSupabase(incomeData: incomes),
        )
        .toList();
  }

  @override
  Future<List<SavingModel>> getSavings() async {
    final userID = supabaseClient.auth.currentUser!.id;
    final savingData = await supabaseClient
        .from('savings')
        .select()
        .eq('user_id', userID);

    return savingData
        .map<SavingModel>(
          (savings) => SavingModel.fromSupabase(savingData: savings),
        )
        .toList();
  }

  @override
  Future<List<SpendingModel>> getSpendings() async {
    final userID = supabaseClient.auth.currentUser!;
    final spendingData = await supabaseClient
        .from('savings')
        .select()
        .eq('user_id', userID);

    return spendingData
        .map<SpendingModel>(
          (spendings) => SpendingModel.fromSupabase(spendingData: spendings),
        )
        .toList();
  }

  @override
  Future<void> updateIncome({required IncomeModel income}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient
        .from('incomes')
        .update({
          'type': income.type,
          'amount': income.amount,
          'date': income.date,
        })
        .eq('id', income.id)
        .eq('user_id', userID);
  }

  @override
  Future<void> updateSaving({required SavingModel saving}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient
        .from('savings')
        .update({
          'category': saving.category,
          'description': saving.description,
          'total_amount': saving.totalAmount,
          'saved_amount': saving.savedAmount,
          'duration': saving.duration,
        })
        .eq('id', saving.id)
        .eq('user_id', userID);
  }

  @override
  Future<void> updateSpending({required SpendingModel spending}) async {
    final userID = supabaseClient.auth.currentUser!;
    await supabaseClient
        .from('spendings')
        .update({
          'category': spending.category,
          'description': spending.description,
          'amount': spending.amount,
          'date': spending.date,
        })
        .eq('id', spending.id)
        .eq('user_id', userID);
  }
}
