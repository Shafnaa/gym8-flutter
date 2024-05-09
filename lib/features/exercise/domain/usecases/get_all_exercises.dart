import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/domain/repositories/exercise_repository.dart';

class GetAllExercises implements UseCase<List<Exercise>, NoParams> {
  final ExerciseRepository exerciseRepository;
  GetAllExercises(this.exerciseRepository);

  @override
  Future<Either<Failure, List<Exercise>>> call(NoParams params) async {
    return await exerciseRepository.getAllExercises();
  }
}
