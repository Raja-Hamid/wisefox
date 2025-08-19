import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDashboardDataRequested extends DashboardEvent {
  FetchDashboardDataRequested();
}
