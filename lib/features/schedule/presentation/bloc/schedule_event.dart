part of 'schedule_bloc.dart';

@immutable
sealed class ScheduleEvent {}

final class ScheduleFetchAllSchedules extends ScheduleEvent {}

final class ScheduleFetchSchedule extends ScheduleEvent {
  final int id;

  ScheduleFetchSchedule({
    required this.id,
  });
}
