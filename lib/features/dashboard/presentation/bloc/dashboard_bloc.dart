import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisefox/core/usecases/use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/add_income_use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/add_saving_use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/add_spending_use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/fetch_dashboard_data.dart';
import 'package:wisefox/features/dashboard/domain/usecases/fetch_incomes_use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/fetch_savings_use_case.dart';
import 'package:wisefox/features/dashboard/domain/usecases/fetch_spendings_use_case.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:wisefox/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FetchDashboardDataUseCase fetchDashboardDataUseCase;
  final FetchIncomeUseCase fetchIncomesUseCase;
  final FetchSavingsUseCase fetchSavingsUseCase;
  final FetchSpendingsUseCase fetchSpendingsUseCase;
  final AddIncomeUseCase addIncomeUseCase;
  final AddSavingUseCase addSavingUseCase;
  final AddSpendingUseCase addSpendingUseCase;

  DashboardBloc({
    required this.fetchDashboardDataUseCase,
    required this.fetchIncomesUseCase,
    required this.fetchSavingsUseCase,
    required this.fetchSpendingsUseCase,
    required this.addIncomeUseCase,
    required this.addSavingUseCase,
    required this.addSpendingUseCase,
  }) : super(DashboardInitial()) {
    on<FetchDashboardDataRequested>(_onFetchDashboardDataRequested);
    on<FetchIncomesRequested>(_onFetchIncomesRequested);
    on<FetchSavingsRequested>(_onFetchSavingsRequested);
    on<FetchSpendingsRequested>(_onFetchSpendingsRequested);

    on<AddIncomeRequested>(_onAddIncomeRequested);
    on<AddSavingRequested>(_onAddSavingRequested);
    on<AddSpendingRequested>(_onAddSpendingRequested);
  }
  Future<void> _onFetchDashboardDataRequested(
    FetchDashboardDataRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.home));
    final result = await fetchDashboardDataUseCase(NoParams());

    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.home,
        ),
      ),
      (dashboardData) => emit(
        DashboardSuccess(
          entity: dashboardData,
          screenType: DashboardScreenType.home,
        ),
      ),
    );
  }

  Future<void> _onFetchIncomesRequested(
    FetchIncomesRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.mainTransactions));
    final result = await fetchIncomesUseCase(NoParams());

    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
      (incomes) => emit(
        DashboardSuccess(
          entity: incomes,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
    );
  }

  Future<void> _onFetchSavingsRequested(
    FetchSavingsRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.savings));
    final result = await fetchSavingsUseCase(NoParams());

    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.savings,
        ),
      ),
      (savings) => emit(
        DashboardSuccess(
          entity: savings,
          screenType: DashboardScreenType.savings,
        ),
      ),
    );
  }

  Future<void> _onFetchSpendingsRequested(
    FetchSpendingsRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.mainTransactions));
    final result = await fetchSpendingsUseCase(NoParams());

    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
      (spendings) => emit(
        DashboardSuccess(
          entity: spendings,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
    );
  }

  Future<void> _onAddIncomeRequested(
    AddIncomeRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.mainTransactions));
    final result = await addIncomeUseCase(event.entity);
    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
      (spendings) => emit(
        DashboardSuccess(
          entity: spendings,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
    );
  }

  Future<void> _onAddSavingRequested(
    AddSavingRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.savings));
    final result = await addSavingUseCase(event.entity);
    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.savings,
        ),
      ),
      (spendings) => emit(
        DashboardSuccess(
          entity: spendings,
          screenType: DashboardScreenType.savings,
        ),
      ),
    );
  }

  Future<void> _onAddSpendingRequested(
    AddSpendingRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading(screenType: DashboardScreenType.mainTransactions));
    final result = await addSpendingUseCase(event.entity);
    result.fold(
      (failure) => emit(
        DashboardFailure(
          error: failure.message,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
      (spendings) => emit(
        DashboardSuccess(
          entity: spendings,
          screenType: DashboardScreenType.mainTransactions,
        ),
      ),
    );
  }
}
