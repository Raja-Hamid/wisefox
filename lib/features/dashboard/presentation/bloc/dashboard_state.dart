import 'package:equatable/equatable.dart';
import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';

enum DashboardScreenType { home, mainTransactions, savings, statistics }

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {
  final DashboardScreenType screenType;

  const DashboardLoading({required this.screenType});

  @override
  List<Object?> get props => [screenType];
}

class DashboardSuccess extends DashboardState {
  final DashboardEntity entity;
  final DashboardScreenType screenType;

  const DashboardSuccess({required this.entity, required this.screenType});

  @override
  List<Object?> get props => [entity, screenType];
}

class DashboardFailure extends DashboardState {
  final String error;
  final DashboardScreenType screenType;

  const DashboardFailure({required this.error, required this.screenType});

  @override
  List<Object?> get props => [error, screenType];
}
