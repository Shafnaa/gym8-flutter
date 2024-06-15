import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/constants/constants.dart';
import 'package:gym8/core/error/exception.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/history/data/datasources/history_remote_data_source.dart';
import 'package:gym8/features/history/domain/entities/history.dart';
import 'package:gym8/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryRemoteDataSource historyRemoteDataSource;
  final ConnectionChecker connectionChecker;
  HistoryRepositoryImpl(
    this.historyRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<History>>> getAllHistories() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final histories = await historyRemoteDataSource.getAllHistories();

      return right(histories);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<History>>> recordHistory() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final history = await historyRemoteDataSource.recordHistory();

      return right(history);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
