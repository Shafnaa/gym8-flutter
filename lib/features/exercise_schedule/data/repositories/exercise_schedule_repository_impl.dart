import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/constants/constants.dart';
import 'package:gym8/core/error/exception.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/exercise_schedule/data/datasources/exercise_schedule_remote_data_source.dart';
import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';
import 'package:gym8/features/exercise_schedule/domain/repositories/exercise_schedule_repository.dart';

class ExerciseScheduleRepositoryImpl implements ExerciseScheduleRepository {
  final ExerciseScheduleRemoteDataSource exerciseRemoteDataSource;
  final ConnectionChecker connectionChecker;
  ExerciseScheduleRepositoryImpl(
    this.exerciseRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<ExerciseSchedule>>>
      getAllExerciseSchedules() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final exercises =
          await exerciseRemoteDataSource.getAllExerciseSchedules();

      return right(exercises);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, ExerciseSchedule>> getExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final exercise = await exerciseRemoteDataSource.getExerciseSchedule(
        exerciseId: exerciseId,
        scheduleId: scheduleId,
      );

      return right(exercise);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ExerciseSchedule>>> triggerExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final exercises = await exerciseRemoteDataSource.triggerExerciseSchedule(
        exerciseId: exerciseId,
        scheduleId: scheduleId,
      );

      return right(exercises);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
