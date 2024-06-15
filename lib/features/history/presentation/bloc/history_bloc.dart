import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/history/domain/entities/history.dart';
import 'package:gym8/features/history/domain/usecases/get_all_histories.dart';
import 'package:gym8/features/history/domain/usecases/record_history.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetAllHistories _getAllHistories;
  final RecordHistory _recordHistory;

  HistoryBloc({
    required GetAllHistories getAllHistories,
    required RecordHistory recordHistory,
  })  : _getAllHistories = getAllHistories,
        _recordHistory = recordHistory,
        super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) => emit(HistoryLoading()));
    on<HistoryFetchAllHistories>(_onFetchAllHistories);
    on<HistoryRecordHistory>(_onRecordHistory);
  }

  void _onFetchAllHistories(
    HistoryFetchAllHistories event,
    Emitter<HistoryState> emit,
  ) async {
    final res = await _getAllHistories(NoParams());

    res.fold(
      (l) => emit(HistoryFailure(l.message)),
      (r) => emit(HistoriesDisplaySuccess(r)),
    );
  }

  void _onRecordHistory(
    HistoryRecordHistory event,
    Emitter<HistoryState> emit,
  ) async {
    final res = await _recordHistory(NoParams());

    res.fold(
      (l) => emit(HistoryFailure(l.message)),
      (r) => emit(HistoryRecordSuccess(r)),
    );
  }
}
