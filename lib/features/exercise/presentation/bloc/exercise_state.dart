part of 'exercise_bloc.dart';

@immutable
sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseFailure extends ExerciseState {
  final String error;
  ExerciseFailure(this.error);
}

final class ExercisesDisplaySuccess extends ExerciseState {
  final List<Exercise> exercises;
  ExercisesDisplaySuccess(this.exercises);
}

final class ExerciseDisplaySuccess extends ExerciseState {
  final Exercise exercise;
  ExerciseDisplaySuccess(this.exercise);
}
