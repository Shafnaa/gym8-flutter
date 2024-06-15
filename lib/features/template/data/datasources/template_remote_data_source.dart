import 'package:gym8/core/error/exception.dart';
import 'package:gym8/features/template/data/models/template_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class TemplateRemoteDataSource {
  Future<List<TemplateModel>> getAllTemplates();
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  final SupabaseClient supabaseClient;
  TemplateRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<TemplateModel>> getAllTemplates() async {
    try {
      var query = supabaseClient.from("templates").select(
            '*',
          );

      final templates = await query;

      return templates
          .map(
            (template) => TemplateModel.fromJson(template),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
