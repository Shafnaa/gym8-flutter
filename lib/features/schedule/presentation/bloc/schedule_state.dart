part of 'schedule_bloc.dart';

@immutable
sealed class ScheduleState {}

final class ScheduleInitial extends ScheduleState {}

final class ScheduleLoading extends ScheduleState {}

final class ScheduleFailure extends ScheduleState {
  final String error;
  ScheduleFailure(this.error);
}

final class SchedulesDisplaySuccess extends ScheduleState {
  final List<Schedule> schedules;
  SchedulesDisplaySuccess(this.schedules);
}
