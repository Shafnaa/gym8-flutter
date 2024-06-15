import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/features/template/domain/entities/template.dart';

abstract interface class TemplateRepository {
  Future<Either<Failure, List<Template>>> getAllTemplates();
}
