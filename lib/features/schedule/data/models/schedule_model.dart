import 'package:gym8/features/schedule/domain/entities/schedule.dart';

class ScheduleModel extends Schedule {
  ScheduleModel({
    required super.id,
    required super.dayId,
    super.dayName,
    required super.splitId,
    super.splitName,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'day_id': dayId,
      'split_id': splitId,
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> map) {
    return ScheduleModel(
      id: map['id'] as int,
      dayId: map['day_id'] as int,
      splitId: map['split_id'] as int,
    );
  }

  ScheduleModel copyWith({
    int? id,
    int? dayId,
    String? dayName,
    int? splitId,
    String? splitName,
  }) {
    return ScheduleModel(
      id: id ?? this.id,
      dayId: dayId ?? this.dayId,
      dayName: dayName ?? this.dayName,
      splitId: splitId ?? this.splitId,
      splitName: splitName ?? this.splitName,
    );
  }
}
