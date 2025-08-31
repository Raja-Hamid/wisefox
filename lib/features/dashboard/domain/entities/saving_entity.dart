enum SavingsCategory { vehicle, property, education, electronicGadget, other }

class SavingEntity {
  final String id;
  final SavingsCategory category;
  final String description;
  final double totalAmount;
  final double savedAmount;
  final DateTime duration;

  SavingEntity({
    required this.id,
    required this.category,
    required this.description,
    required this.totalAmount,
    required this.savedAmount,
    required this.duration,
  });
}
