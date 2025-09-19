class SavingEntity {
  final String? id;
  final SavingsCategory category;
  final String description;
  final double totalAmount;
  final double savedAmount;
  final DateTime duration;

  SavingEntity({
    this.id,
    required this.category,
    required this.description,
    required this.totalAmount,
    required this.savedAmount,
    required this.duration,
  });
}

enum SavingsCategory { vehicle, property, education, electronicGadget, other }

extension SavingsCategoryMapper on SavingsCategory {
  String get label {
    final name = this.name;
    final words = name.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
    return words[0].toUpperCase() + words.substring(1);
  }

  String toSupabase() {
    switch (this) {
      case SavingsCategory.vehicle:
        return "Vehicle";
      case SavingsCategory.property:
        return "Property";
      case SavingsCategory.education:
        return "Education";
      case SavingsCategory.electronicGadget:
        return "Electronic Gadget";
      case SavingsCategory.other:
        return "Other";
    }
  }

  static SavingsCategory fromSupabase(String value) {
    switch (value) {
      case "Vehicle":
        return SavingsCategory.vehicle;
      case "Property":
        return SavingsCategory.property;
      case "Education":
        return SavingsCategory.education;
      case "Electronic Gadget":
        return SavingsCategory.electronicGadget;
      default:
        return SavingsCategory.other;
    }
  }
}
