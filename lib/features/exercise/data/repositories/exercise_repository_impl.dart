import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/constants/constants.dart';
import 'package:gym8/core/error/exception.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/exercise/data/datasources/exercise_remote_data_source.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/domain/repositories/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource exerciseRemoteDataSource;
  final ConnectionChecker connectionChecker;
  ExerciseRepositoryImpl(
    this.exerciseRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Exercise>>> getAllExercises() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final exercises = await exerciseRemoteDataSource.getAllExercises();

      return right(exercises);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Exercise>> getExercise({
    required int id,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final exercise = await exerciseRemoteDataSource.getExercise(id: id);

      return right(exercise);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
