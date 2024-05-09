import 'package:gym8/core/error/exception.dart';
import 'package:gym8/features/exercise/data/models/exercise_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getAllExercises();
  Future<ExerciseModel> getExercise({
    required int id,
  });
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final SupabaseClient supabaseClient;
  ExerciseRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ExerciseModel>> getAllExercises() async {
    try {
      final exercises = await supabaseClient
          .from(
            'exercises',
          )
          .select(
            '*, muscles (name, image_url), types (name), equipments (name), difficulties (name)',
          );

      return exercises
          .map(
            (exercise) => ExerciseModel.fromJson(exercise).copyWith(
              muscleName: exercise['muscles']['name'],
              muscleImageUrl: exercise['muscles']['image_url'],
              typeName: exercise['types']['name'],
              equipmentName: exercise['equipments']['name'],
              difficultyName: exercise['difficulties']['name'],
            ),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ExerciseModel> getExercise({
    required int id,
  }) async {
    try {
      final exercise = await supabaseClient
          .from(
            'exercises',
          )
          .select(
            '*, muscles (name), types (name), equipments (name), difficulties (name)',
          )
          .eq(
            'id',
            id,
          );

      return ExerciseModel.fromJson(exercise.first).copyWith(
        muscleName: exercise.first['muscles']['name'],
        muscleImageUrl: exercise.first['muscles']['image_url'],
        typeName: exercise.first['types']['name'],
        equipmentName: exercise.first['equipments']['name'],
        difficultyName: exercise.first['difficulties']['name'],
      );
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
