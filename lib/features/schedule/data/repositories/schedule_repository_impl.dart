import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/constants/constants.dart';
import 'package:gym8/core/error/exception.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/schedule/data/datasources/schedule_remote_data_source.dart';
import 'package:gym8/features/schedule/domain/entities/schedule.dart';
import 'package:gym8/features/schedule/domain/repositories/schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource scheduleRemoteDataSource;
  final ConnectionChecker connectionChecker;
  ScheduleRepositoryImpl(
    this.scheduleRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<Schedule>>> getAllSchedules() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(Constants.noConnectionErrorMessage));
      }

      final schedules = await scheduleRemoteDataSource.getAllSchedules();

      return right(schedules);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
