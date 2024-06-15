import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';
import 'package:gym8/features/exercise_schedule/domain/repositories/exercise_schedule_repository.dart';

class TriggerExerciseSchedule
    implements UseCase<List<ExerciseSchedule>, TriggerExerciseScheduleParams> {
  final ExerciseScheduleRepository exerciseScheduleRepository;
  TriggerExerciseSchedule(this.exerciseScheduleRepository);

  @override
  Future<Either<Failure, List<ExerciseSchedule>>> call(
    TriggerExerciseScheduleParams params,
  ) async {
    return await exerciseScheduleRepository.triggerExerciseSchedule(
      exerciseId: params.exerciseId,
      scheduleId: params.scheduleId,
    );
  }
}

class TriggerExerciseScheduleParams {
  final int exerciseId;
  final int scheduleId;

  TriggerExerciseScheduleParams({
    required this.exerciseId,
    required this.scheduleId,
  });
}
