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
  final List<History> histories;
  HistoriesDisplaySuccess(this.histories);
}

final class HistoryRecordSuccess extends HistoryState {
  final List<History> histories;
  HistoryRecordSuccess(this.histories);
}
