import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';
import 'package:gym8/features/exercise_schedule/domain/repositories/exercise_schedule_repository.dart';

class GetAllExerciseSchedules
    implements UseCase<List<ExerciseSchedule>, NoParams> {
  final ExerciseScheduleRepository exerciseScheduleRepository;
  GetAllExerciseSchedules(this.exerciseScheduleRepository);

  @override
  Future<Either<Failure, List<ExerciseSchedule>>> call(NoParams params) async {
    return await exerciseScheduleRepository.getAllExerciseSchedules();
  }
}
