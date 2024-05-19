part of 'history_bloc.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryFailure extends HistoryState {
  final String error;
  HistoryFailure(this.error);
}

final class HistoriesDisplaySuccess extends HistoryState {
  final List<History> schedules;
  HistoriesDisplaySuccess(this.schedules);
}
