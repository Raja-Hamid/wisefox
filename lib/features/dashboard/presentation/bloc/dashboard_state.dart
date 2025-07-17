import 'package:wisefox/features/dashboard/domain/entities/dashboard_entity.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final DashboardEntity entity;

  DashboardSuccess(this.entity);
}

class DashboardFailure extends DashboardState {
  final String error;

  DashboardFailure(this.error);
}
