import 'package:wisefox/core/common/entities/user_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';

class DashboardEntity {
  final UserEntity user;
  final List<IncomeEntity> incomes;
  final List<SpendingEntity> spendings;
  final List<SavingEntity> savings;

  DashboardEntity({
    required this.user,
    required this.incomes,
    required this.spendings,
    required this.savings,
  });

  String get userName => '${user.firstName} ${user.lastName}';

  double get totalIncome =>
      incomes.fold<double>(0, (sum, income) => sum + income.amount);
  double get totalSpending =>
      spendings.fold<double>(0, (sum, spending) => sum + spending.amount);

  double get totalBalance => totalIncome - totalSpending;
}
