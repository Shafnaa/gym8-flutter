import 'package:gym8/core/error/exception.dart';
import 'package:gym8/features/exercise/data/models/exercise_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getAllExercises(
      // {
      // String? filterByName,
      // List<int>? filterByMuscles,
      // List<int>? filterByTypes,
      // List<int>? filterByEquipments,
      // List<int>? filterByDifficulties,
      // int limitDocuments,
      // }
      );
  Future<ExerciseModel> getExercise({
    required int id,
  });
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final SupabaseClient supabaseClient;
  ExerciseRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ExerciseModel>> getAllExercises(
      // {
      // String? filterByName,
      // List<int>? filterByMuscles,
      // List<int>? filterByTypes,
      // List<int>? filterByEquipments,
      // List<int>? filterByDifficulties,
      // int limitDocuments = 10,
      // }
      ) async {
    try {
      var query = supabaseClient.from("exercises").select(
            '*, muscles (name, image_url), types (name), equipments (name), difficulties (name)',
          );

      // if (filterByName != null) {
      //   query = query.eq("name", filterByName);
      // }

      // if (filterByMuscles != null) {
      //   query = query.inFilter("muscle_id", filterByMuscles);
      // }

      // if (filterByTypes != null) {
      //   query = query.inFilter("type_id", filterByTypes);
      // }

      // if (filterByEquipments != null) {
      //   query = query.inFilter("equipment_id", filterByEquipments);
      // }

      // if (filterByDifficulties != null) {
      //   query = query.inFilter("difficulty_id", filterByDifficulties);
      // }

      final exercises = await query;

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
