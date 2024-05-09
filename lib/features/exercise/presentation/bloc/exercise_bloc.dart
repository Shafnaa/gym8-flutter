import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/domain/usecases/get_all_exercises.dart';
import 'package:gym8/features/exercise/domain/usecases/get_exercise.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetAllExercises _getAllExercises;
  final GetExercise _getExercise;

  ExerciseBloc({
    required GetAllExercises getAllExercises,
    required GetExercise getExercise,
  })  : _getAllExercises = getAllExercises,
        _getExercise = getExercise,
        super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) => emit(ExerciseLoading()));
    on<ExerciseFetchAllExercises>(_onFetchAllExercises);
    on<ExerciseFetchExercise>(_onFetchExercise);
  }

  void _onFetchAllExercises(
    ExerciseFetchAllExercises event,
    Emitter<ExerciseState> emit,
  ) async {
    final res = await _getAllExercises(NoParams());

    res.fold(
      (l) => emit(ExerciseFailure(l.message)),
      (r) => emit(ExercisesDisplaySuccess(r)),
    );
  }

  void _onFetchExercise(
    ExerciseFetchExercise event,
    Emitter<ExerciseState> emit,
  ) async {
    final res = await _getExercise(
      GetExerciseParams(
        id: event.id,
      ),
    );

    res.fold(
      (l) => emit(ExerciseFailure(l.message)),
      (r) => emit(ExerciseDisplaySuccess(r)),
    );
  }
}
