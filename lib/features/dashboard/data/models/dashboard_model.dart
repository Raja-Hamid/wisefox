import 'package:wisefox/features/dashboard/data/models/transaction_model.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.userName,
    required super.totalBalance,
    required super.transactions,
  });

  factory DashboardModel.fromSupabase({
    required Map<String, dynamic> userData,
    required List<dynamic> transactionsData,
  }) {
    final transactions =
        transactionsData
            .map((json) => TransactionModel.fromJson(json))
            .toList();

    final totalIncome = transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);

    final totalSpending = transactions
        .where((t) => t.type == TransactionType.spending)
        .fold(0.0, (sum, t) => sum + t.amount);

    return DashboardModel(
      userName: '${userData['first_name']} ${userData['last_name']}',
      totalBalance: totalIncome - totalSpending,
      transactions: transactions,
    );
  }
}
