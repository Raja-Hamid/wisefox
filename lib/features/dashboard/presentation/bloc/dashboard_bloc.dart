import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/get_dashboard_data.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardDataUseCase getDashboardDataUseCase;

  DashboardBloc({required this.getDashboardDataUseCase})
    : super(DashboardInitial()) {
    on<GetDashboardDataRequested>(_onGetDashboardDataRequested);
  }
  Future<void> _onGetDashboardDataRequested(
    GetDashboardDataRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    final result = await getDashboardDataUseCase(NoParams());

    result.fold(
      (failure) => emit(DashboardFailure(failure.message)),
      (dashboardData) => emit(DashboardSuccess(dashboardData)),
    );
  }
}
