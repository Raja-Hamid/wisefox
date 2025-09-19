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

enum SpendingCategory { food, transportation, entertainment, shopping, other }

extension SpendingCategoryMapper on SpendingCategory {
  String toSupabase() {
    switch (this) {
      case SpendingCategory.food:
        return "Food";
      case SpendingCategory.transportation:
        return "Transportation";
      case SpendingCategory.entertainment:
        return "Entertainment";
      case SpendingCategory.shopping:
        return "Shopping";
      case SpendingCategory.other:
        return "Other";
    }
  }

  static SpendingCategory fromSupabase(String value) {
    switch (value) {
      case "Food":
        return SpendingCategory.food;
      case "Transportation":
        return SpendingCategory.transportation;
      case "Entertainment":
        return SpendingCategory.entertainment;
      case "Shopping":
        return SpendingCategory.shopping;
      default:
        return SpendingCategory.other;
    }
  }
}
