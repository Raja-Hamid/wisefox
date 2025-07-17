import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.name,
    required super.type,
    required super.amount,
    required super.time,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      name: json['name'] as String,
      type: transactionTypeFromString(json['type']),
      amount: double.parse(json['amount']),
      time: DateTime.parse(json['json']),
    );
  }
}

TransactionType transactionTypeFromString(String type) {
  switch (type.toLowerCase()) {
    case 'income':
      return TransactionType.income;
    case 'spending':
      return TransactionType.spending;
    default:
      throw Exception('Invalid transaction type: $type');
  }
}
