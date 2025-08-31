enum SpendingCategory { food, transportation, entertainment, shopping, other }

class SpendingEntity {
  final String id;
  final SpendingCategory category;
  final double amount;
  final String description;
  final DateTime date;

  SpendingEntity({
    required this.id,
    required this.category,
    required this.amount,
    required this.description,
    required this.date,
  });
}
