import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';

abstract interface class ExerciseScheduleRepository {
  Future<Either<Failure, List<ExerciseSchedule>>> getAllExerciseSchedules();

  Future<Either<Failure, ExerciseSchedule>> getExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  });

  Future<Either<Failure, List<ExerciseSchedule>>> triggerExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  });
}
