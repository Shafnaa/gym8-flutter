part of 'exercise_schedule_bloc.dart';

@immutable
sealed class ExerciseScheduleState {}

final class ExerciseScheduleInitial extends ExerciseScheduleState {}

final class ExerciseScheduleLoading extends ExerciseScheduleState {}

final class ExerciseScheduleFailure extends ExerciseScheduleState {
  final String error;
  ExerciseScheduleFailure(this.error);
}

final class ExerciseSchedulesDisplaySuccess extends ExerciseScheduleState {
  final List<ExerciseSchedule> exerciseSchedules;
  ExerciseSchedulesDisplaySuccess(this.exerciseSchedules);
}

final class ExerciseScheduleDisplaySuccess extends ExerciseScheduleState {
  final ExerciseSchedule exerciseSchedule;
  ExerciseScheduleDisplaySuccess(this.exerciseSchedule);
}

final class ExerciseScheduleTriggerSuccess extends ExerciseScheduleState {
  final List<ExerciseSchedule> exerciseSchedules;
  ExerciseScheduleTriggerSuccess(this.exerciseSchedules);
}
