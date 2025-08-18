import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/fetch_dashboard_data.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FetchDashboardDataUseCase fetchDashboardDataUseCase;

  DashboardBloc({required this.fetchDashboardDataUseCase})
    : super(DashboardInitial()) {
    on<FetchDashboardDataRequested>(_onFetchDashboardDataRequested);
  }
  Future<void> _onFetchDashboardDataRequested(
    FetchDashboardDataRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    final result = await fetchDashboardDataUseCase(NoParams());

    result.fold(
      (failure) => emit(DashboardFailure(failure.message)),
      (dashboardData) => emit(DashboardSuccess(dashboardData)),
    );
  }
}
