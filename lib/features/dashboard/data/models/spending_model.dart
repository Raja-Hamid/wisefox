import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';

class SpendingModel extends SpendingEntity {
  SpendingModel({
    required super.id,
    required super.category,
    required super.amount,
    required super.description,
    required super.date,
  });

  factory SpendingModel.fromSupabase({
    required Map<String, dynamic> spendingData,
  }) {
    return SpendingModel(
      id: spendingData['id'] ?? '',
      category: spendingData['category'] ?? '',
      amount: double.tryParse(spendingData['amount']) ?? 0.0,
      description: spendingData['description'] ?? '',
      date: DateTime.parse(spendingData['date']),
    );
  }

  factory SpendingModel.fromEntity({required SpendingEntity entity}) {
    return SpendingModel(
      id: entity.id,
      category: entity.category,
      amount: entity.amount,
      description: entity.description,
      date: entity.date,
    );
  }

  SpendingEntity toEntity() {
    return SpendingEntity(
      id: id,
      category: category,
      amount: amount,
      description: description,
      date: date,
    );
  }
}
