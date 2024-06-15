part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

final class HistoryFetchAllHistories extends HistoryEvent {}

final class HistoryFetchHistory extends HistoryEvent {
  final int id;

  HistoryFetchHistory({
    required this.id,
  });
}

final class HistoryRecordHistory extends HistoryEvent {}
