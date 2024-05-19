import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/features/history/domain/entities/history.dart';

abstract interface class HistoryRepository {
  Future<Either<Failure, List<History>>> getAllHistories();
}
