import 'package:equatable/equatable.dart';
import 'package:wisefox/features/dashboard/domain/entities/income_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/saving_entity.dart';
import 'package:wisefox/features/dashboard/domain/entities/spending_entity.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDashboardDataRequested extends DashboardEvent {
  FetchDashboardDataRequested();
}

class FetchIncomesRequested extends DashboardEvent {
  FetchIncomesRequested();
}

class FetchSavingsRequested extends DashboardEvent {
  FetchSavingsRequested();
}

class FetchSpendingsRequested extends DashboardEvent {
  FetchSpendingsRequested();
}

class AddIncomeRequested extends DashboardEvent {
  final IncomeEntity entity;

  AddIncomeRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class AddSavingRequested extends DashboardEvent {
  final SavingEntity entity;

  AddSavingRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class AddSpendingRequested extends DashboardEvent {
  final SpendingEntity entity;

  AddSpendingRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class DeleteIncomeRequested extends DashboardEvent {
  final IncomeEntity entity;

  DeleteIncomeRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class DeleteSavingRequested extends DashboardEvent {
  final SavingEntity entity;

  DeleteSavingRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class DeleteSpendingRequested extends DashboardEvent {
  final SpendingEntity entity;

  DeleteSpendingRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class UpdateIncomeRequested extends DashboardEvent {
  final IncomeEntity entity;

  UpdateIncomeRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class UpdateSavingRequested extends DashboardEvent {
  final SavingEntity entity;

  UpdateSavingRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class UpdateSpendingRequested extends DashboardEvent {
  final SpendingEntity entity;

  UpdateSpendingRequested({required this.entity});

  @override
  List<Object?> get props => [entity];
}
