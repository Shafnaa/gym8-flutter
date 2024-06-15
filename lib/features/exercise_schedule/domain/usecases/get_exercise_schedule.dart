import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';
import 'package:gym8/features/exercise_schedule/domain/repositories/exercise_schedule_repository.dart';

class GetExerciseSchedule
    implements UseCase<ExerciseSchedule, GetExerciseScheduleParams> {
  final ExerciseScheduleRepository exerciseScheduleRepository;
  GetExerciseSchedule(this.exerciseScheduleRepository);

  @override
  Future<Either<Failure, ExerciseSchedule>> call(
    GetExerciseScheduleParams params,
  ) async {
    return await exerciseScheduleRepository.getExerciseSchedule(
      exerciseId: params.exerciseId,
      scheduleId: params.scheduleId,
    );
  }
}

class GetExerciseScheduleParams {
  final int exerciseId;
  final int scheduleId;

  GetExerciseScheduleParams({
    required this.exerciseId,
    required this.scheduleId,
  });
}
