import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/schedule/domain/entities/schedule.dart';
import 'package:gym8/features/schedule/domain/usecases/get_all_schedules.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final GetAllSchedules _getAllSchedules;

  ScheduleBloc({
    required GetAllSchedules getAllSchedules,
  })  : _getAllSchedules = getAllSchedules,
        super(ScheduleInitial()) {
    on<ScheduleEvent>((event, emit) => emit(ScheduleLoading()));
    on<ScheduleFetchAllSchedules>(_onFetchAllSchedules);
  }

  void _onFetchAllSchedules(
    ScheduleFetchAllSchedules event,
    Emitter<ScheduleState> emit,
  ) async {
    final res = await _getAllSchedules(NoParams());

    res.fold(
      (l) => emit(ScheduleFailure(l.message)),
      (r) => emit(SchedulesDisplaySuccess(r)),
    );
  }
}
