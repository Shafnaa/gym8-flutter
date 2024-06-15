import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/constants/constants.dart';
import 'package:gym8/core/error/exception.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/template/data/datasources/template_remote_data_source.dart';
import 'package:gym8/features/template/domain/entities/template.dart';
import 'package:gym8/features/template/domain/repositories/template_repository.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateRemoteDataSource templateRemoteDataSource;
  final ConnectionChecker connectionChecker;
  TemplateRepositoryImpl(
    this.templateRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Template>>> getAllTemplates() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final templates = await templateRemoteDataSource.getAllTemplates();

      return right(templates);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
