import 'package:gym8/features/schedule/domain/entities/day.dart';
import 'package:gym8/features/schedule/domain/entities/schedule.dart';
import 'package:gym8/features/schedule/domain/entities/split.dart';

class ScheduleModel extends Schedule {
  ScheduleModel({
    required super.id,
    required super.day,
    required super.split,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'day_id': day.id,
      'split_id': split.id,
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> map) {
    return ScheduleModel(
      id: map['id'] as int,
      day: Day(
        id: map['days']['id'] as int,
        name: map['days']['name'] as String,
      ),
      split: Split(
        id: map['splits']['id'] as int,
        name: map['splits']['name'] as String,
      ),
    );
  }

  ScheduleModel copyWith({
    int? id,
    Day? day,
    Split? split,
  }) {
    return ScheduleModel(
      id: id ?? this.id,
      day: day ?? this.day,
      split: split ?? this.split,
    );
  }
}
