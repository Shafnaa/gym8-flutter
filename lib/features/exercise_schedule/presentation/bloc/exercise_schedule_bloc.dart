import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';
import 'package:gym8/features/exercise_schedule/domain/usecases/get_all_exercise_schedules.dart';
import 'package:gym8/features/exercise_schedule/domain/usecases/get_exercise_schedule.dart';
import 'package:gym8/features/exercise_schedule/domain/usecases/trigger_exercise_schedule.dart';

part 'exercise_schedule_event.dart';
part 'exercise_schedule_state.dart';

class ExerciseScheduleBloc
    extends Bloc<ExerciseScheduleEvent, ExerciseScheduleState> {
  final GetAllExerciseSchedules _getAllExerciseSchedules;
  final GetExerciseSchedule _getExerciseSchedule;
  final TriggerExerciseSchedule _triggerExerciseSchedule;

  ExerciseScheduleBloc({
    required GetAllExerciseSchedules getAllExerciseSchedules,
    required GetExerciseSchedule getExerciseSchedule,
    required TriggerExerciseSchedule triggerExerciseSchedule,
  })  : _getAllExerciseSchedules = getAllExerciseSchedules,
        _getExerciseSchedule = getExerciseSchedule,
        _triggerExerciseSchedule = triggerExerciseSchedule,
        super(ExerciseScheduleInitial()) {
    on<ExerciseScheduleEvent>((event, emit) => emit(ExerciseScheduleLoading()));
    on<ExerciseScheduleFetchAllExerciseSchedules>(_onFetchAllExerciseSchedules);
    on<ExerciseScheduleFetchExerciseSchedule>(_onFetchExerciseSchedule);
    on<ExerciseScheduleTriggerExerciseSchedule>(_onTriggerExerciseSchedule);
  }

  void _onFetchAllExerciseSchedules(
    ExerciseScheduleFetchAllExerciseSchedules event,
    Emitter<ExerciseScheduleState> emit,
  ) async {
    final res = await _getAllExerciseSchedules(NoParams());

    res.fold(
      (l) => emit(ExerciseScheduleFailure(l.message)),
      (r) => emit(ExerciseSchedulesDisplaySuccess(r)),
    );
  }

  void _onFetchExerciseSchedule(
    ExerciseScheduleFetchExerciseSchedule event,
    Emitter<ExerciseScheduleState> emit,
  ) async {
    final res = await _getExerciseSchedule(
      GetExerciseScheduleParams(
        exerciseId: event.exerciseId,
        scheduleId: event.scheduleId,
      ),
    );

    res.fold(
      (l) => emit(ExerciseScheduleFailure(l.message)),
      (r) => emit(ExerciseScheduleDisplaySuccess(r)),
    );
  }

  void _onTriggerExerciseSchedule(
    ExerciseScheduleTriggerExerciseSchedule event,
    Emitter<ExerciseScheduleState> emit,
  ) async {
    final res = await _triggerExerciseSchedule(
      TriggerExerciseScheduleParams(
        exerciseId: event.exerciseId,
        scheduleId: event.scheduleId,
      ),
    );

    res.fold(
      (l) => emit(ExerciseScheduleFailure(l.message)),
      (r) => emit(ExerciseScheduleTriggerSuccess(r)),
    );
  }
}
