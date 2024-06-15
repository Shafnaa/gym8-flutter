import 'package:gym8/core/error/exception.dart';
import 'package:gym8/features/exercise_schedule/data/models/exercise_schedule_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ExerciseScheduleRemoteDataSource {
  Future<List<ExerciseScheduleModel>> getAllExerciseSchedules();
  Future<ExerciseScheduleModel> getExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  });
  Future<List<ExerciseScheduleModel>> triggerExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  });
}

class ExerciseScheduleRemoteDataSourceImpl
    implements ExerciseScheduleRemoteDataSource {
  final SupabaseClient supabaseClient;
  ExerciseScheduleRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ExerciseScheduleModel>> getAllExerciseSchedules() async {
    try {
      var query = supabaseClient.from("exercises_schedules").select(
            '*',
          );

      final exercises = await query;

      return exercises
          .map(
            (exercise) => ExerciseScheduleModel.fromJson(exercise),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ExerciseScheduleModel> getExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  }) async {
    try {
      final exercise = await supabaseClient
          .from(
            'exercises_schedules',
          )
          .select(
            '*',
          )
          .eq(
            'exercise_id',
            exerciseId,
          )
          .eq(
            "schedule_id",
            scheduleId,
          );

      return ExerciseScheduleModel.fromJson(exercise.first);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ExerciseScheduleModel>> triggerExerciseSchedule({
    required int exerciseId,
    required int scheduleId,
  }) async {
    try {
      await supabaseClient.rpc("toggle_exercise_schedule", params: {
        "exercise": exerciseId,
        "schedule": scheduleId,
      });

      var query = supabaseClient.from("exercises_schedules").select(
            '*',
          );

      final exercises = await query;

      return exercises
          .map(
            (exercise) => ExerciseScheduleModel.fromJson(exercise),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
