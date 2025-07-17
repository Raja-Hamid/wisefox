class DashboardEntity {
  final String userName;
  final double totalBalance;
  final List<TransactionEntity> transactions;

  DashboardEntity({
    required this.userName,
    required this.totalBalance,
    required this.transactions,
  });
}

enum TransactionType { income, spending }

class TransactionEntity {
  final String name;
  final TransactionType type;
  final double amount;
  final DateTime time;

  TransactionEntity({
    required this.name,
    required this.type,
    required this.amount,
    required this.time,
  });
}
