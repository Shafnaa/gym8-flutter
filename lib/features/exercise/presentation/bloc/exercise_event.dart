part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseEvent {}

final class ExerciseFetchAllExercises extends ExerciseEvent {}

final class ExerciseFetchExercise extends ExerciseEvent {
  final int id;

  ExerciseFetchExercise({
    required this.id,
  });
}
