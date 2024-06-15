import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/template/domain/entities/template.dart';
import 'package:gym8/features/template/domain/repositories/template_repository.dart';

class GetAllTemplates implements UseCase<List<Template>, NoParams> {
  final TemplateRepository templateRepository;
  GetAllTemplates(this.templateRepository);

  @override
  Future<Either<Failure, List<Template>>> call(NoParams params) async {
    return await templateRepository.getAllTemplates();
  }
}
