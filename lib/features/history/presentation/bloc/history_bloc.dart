import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/history/domain/entities/history.dart';
import 'package:gym8/features/history/domain/usecases/get_all_histories.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetAllHistories _getAllHistories;

  HistoryBloc({
    required GetAllHistories getAllHistories,
  })  : _getAllHistories = getAllHistories,
        super(HistoryInitial()) {
    on<HistoryEvent>((event, emit) => emit(HistoryLoading()));
    on<HistoryFetchAllHistories>(_onFetchAllHistories);
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
}
