import 'package:gym8/core/error/exception.dart';
import 'package:gym8/features/schedule/data/models/schedule_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ScheduleRemoteDataSource {
  Future<List<ScheduleModel>> getAllSchedules();
}

class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  final SupabaseClient supabaseClient;
  ScheduleRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ScheduleModel>> getAllSchedules() async {
    try {
      var query = supabaseClient.from("schedules").select(
            '*, days (*), splits (*)',
          );

      final schedules = await query;

      return schedules
          .map(
            (schedule) => ScheduleModel.fromJson(schedule),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
