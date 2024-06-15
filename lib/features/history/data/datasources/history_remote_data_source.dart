import 'package:gym8/core/error/exception.dart';
import 'package:gym8/features/history/data/models/history_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class HistoryRemoteDataSource {
  Future<List<HistoryModel>> getAllHistories();

  Future<List<HistoryModel>> recordHistory();
}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  final SupabaseClient supabaseClient;
  HistoryRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<HistoryModel>> getAllHistories() async {
    try {
      var query = supabaseClient.from("histories").select(
            '*',
          );

      final histories = await query;

      return histories
          .map(
            (history) => HistoryModel.fromJson(history),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<HistoryModel>> recordHistory() async {
    try {
      await supabaseClient.rpc('record_history');

      return getAllHistories();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
