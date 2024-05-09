import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';

abstract interface class ExerciseRepository {
  Future<Either<Failure, List<Exercise>>> getAllExercises();

  Future<Either<Failure, Exercise>> getExercise({
    required int id,
  });
}
