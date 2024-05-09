import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/domain/repositories/exercise_repository.dart';

class GetExercise implements UseCase<Exercise, GetExerciseParams> {
  final ExerciseRepository exerciseRepository;
  GetExercise(this.exerciseRepository);

  @override
  Future<Either<Failure, Exercise>> call(GetExerciseParams params) async {
    return await exerciseRepository.getExercise(id: params.id);
  }
}

class GetExerciseParams {
  final int id;

  GetExerciseParams({
    required this.id,
  });
}
