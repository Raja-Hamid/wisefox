import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';

class SavingModel extends SavingEntity {
  SavingModel({
    required super.id,
    required super.category,
    required super.description,
    required super.totalAmount,
    required super.savedAmount,
    required super.duration,
  });

  factory SavingModel.fromSupabase({required Map<String, dynamic> savingData}) {
    return SavingModel(
      id: savingData['id'],
      category: SavingsCategory.values.firstWhere(
            (e) => e.name == savingData['category'],
        orElse: () => SavingsCategory.other,
      ),
      description: savingData['description'],
      totalAmount: double.tryParse(savingData['total_amount']) ?? 0.0,
      savedAmount: double.tryParse(savingData['saved_amount']) ?? 0.0,
      duration: DateTime.parse(savingData['duration']),
    );
  }

  factory SavingModel.fromEntity({required SavingEntity entity}) {
    return SavingModel(
      id: entity.id,
      category: entity.category,
      description: entity.description,
      totalAmount: entity.totalAmount,
      savedAmount: entity.savedAmount,
      duration: entity.duration,
    );
  }

  SavingEntity toEntity() {
    return SavingEntity(
      id: id,
      category: category,
      description: description,
      totalAmount: totalAmount,
      savedAmount: savedAmount,
      duration: duration,
    );
  }
}
