import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/features/schedule/domain/entities/schedule.dart';

abstract interface class ScheduleRepository {
  Future<Either<Failure, List<Schedule>>> getAllSchedules();
}
