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

enum IncomeType { salary, business, freelance, pocketMoney, other }

extension IncomeTypeMapper on IncomeType {
  String toSupabase() {
    switch (this) {
      case IncomeType.salary:
        return "Salary";
      case IncomeType.business:
        return "Business";
      case IncomeType.freelance:
        return "Freelance";
      case IncomeType.pocketMoney:
        return "Pocket Money";
      case IncomeType.other:
        return "Other";
    }
  }

  static IncomeType fromSupabase(String value) {
    switch (value) {
      case "Salary":
        return IncomeType.salary;
      case "Business":
        return IncomeType.business;
      case "Freelance":
        return IncomeType.freelance;
      case "Pocket Money":
        return IncomeType.pocketMoney;
      default:
        return IncomeType.other;
    }
  }
}
