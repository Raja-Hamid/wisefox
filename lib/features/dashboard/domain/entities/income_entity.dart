enum IncomeType { salary, business, freelance, pocketMoney, other }

class IncomeEntity {
  final String id;
  final IncomeType type;
  final double amount;
  final DateTime date;

  IncomeEntity({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
  });
}
