import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';

class IncomeModel extends IncomeEntity {
  IncomeModel({
    required super.id,
    required super.type,
    required super.amount,
    required super.date,
  });

  factory IncomeModel.fromSupabase({required Map<String, dynamic> incomeData}) {
    return IncomeModel(
      id: incomeData['id'] ?? '',
      type: incomeData['type'] ?? '',
      amount: double.tryParse(incomeData['amount']) ?? 0.0,
      date: DateTime.parse(incomeData['date']),
    );
  }

  factory IncomeModel.fromEntity({required IncomeEntity entity}) {
    return IncomeModel(
      id: entity.id,
      type: entity.type,
      amount: entity.amount,
      date: entity.date,
    );
  }

  IncomeEntity toEntity() {
    return IncomeEntity(id: id, type: type, amount: amount, date: date);
  }
}
