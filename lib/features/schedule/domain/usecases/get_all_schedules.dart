import 'package:fpdart/fpdart.dart';
import 'package:gym8/core/error/failure.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/schedule/domain/entities/schedule.dart';
import 'package:gym8/features/schedule/domain/repositories/schedule_repository.dart';

class GetAllSchedules implements UseCase<List<Schedule>, NoParams> {
  final ScheduleRepository scheduleRepository;
  GetAllSchedules(this.scheduleRepository);

  @override
  Future<Either<Failure, List<Schedule>>> call(NoParams params) async {
    return await scheduleRepository.getAllSchedules();
  }
}
