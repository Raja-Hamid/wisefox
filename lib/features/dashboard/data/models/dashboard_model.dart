import 'package:wisefox/features/dashboard/data/models/income_model.dart';
import 'package:wisefox/features/dashboard/data/models/saving_model.dart';
import 'package:wisefox/features/dashboard/data/models/spending_model.dart';
import 'package:wisefox/features/dashboard/data/models/user_model.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.user,
    required super.incomes,
    required super.spendings,
    required super.savings,
  });

  factory DashboardModel.fromSupabase({
    required Map<String, dynamic> userData,
    required List<Map<String, dynamic>> incomeData,
    required List<Map<String, dynamic>> spendingData,
    required List<Map<String, dynamic>> savingData,
  }) {
    return DashboardModel(
      user: UserModel.fromSupabase(userData: userData),
      incomes:
          incomeData
              .map((incomes) => IncomeModel.fromSupabase(incomeData: incomes))
              .toList(),
      spendings:
          spendingData
              .map(
                (spendings) =>
                    SpendingModel.fromSupabase(spendingData: spendings),
              )
              .toList(),
      savings:
          savingData
              .map((savings) => SavingModel.fromSupabase(savingData: savings))
              .toList(),
    );
  }
}
