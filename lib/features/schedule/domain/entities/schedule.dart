import 'package:gym8/features/schedule/domain/entities/day.dart';
import 'package:gym8/features/schedule/domain/entities/split.dart';

class Schedule {
  final int id;
  final Day day;
  final Split split;

  Schedule({
    required this.id,
    required this.day,
    required this.split,
  });
}
