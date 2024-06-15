part of 'exercise_schedule_bloc.dart';

@immutable
sealed class ExerciseScheduleEvent {}

final class ExerciseScheduleFetchAllExerciseSchedules
    extends ExerciseScheduleEvent {}

final class ExerciseScheduleFetchExerciseSchedule
    extends ExerciseScheduleEvent {
  final int exerciseId;
  final int scheduleId;

  ExerciseScheduleFetchExerciseSchedule({
    required this.exerciseId,
    required this.scheduleId,
  });
}

final class ExerciseScheduleTriggerExerciseSchedule
    extends ExerciseScheduleEvent {
  final int exerciseId;
  final int scheduleId;

  ExerciseScheduleTriggerExerciseSchedule({
    required this.exerciseId,
    required this.scheduleId,
  });
}
