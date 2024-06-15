import 'package:gym8/features/exercise_schedule/domain/entities/exercise_schedule.dart';

class ExerciseScheduleModel extends ExerciseSchedule {
  ExerciseScheduleModel({
    required super.exerciseId,
    required super.scheduleId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'exercise_id': exerciseId,
      'schedule_id': scheduleId,
    };
  }

  factory ExerciseScheduleModel.fromJson(Map<String, dynamic> map) {
    return ExerciseScheduleModel(
      exerciseId: map["exercise_id"],
      scheduleId: map["schedule_id"],
    );
  }

  ExerciseScheduleModel copyWith({
    int? exerciseId,
    int? scheduleId,
  }) {
    return ExerciseScheduleModel(
      exerciseId: exerciseId ?? this.exerciseId,
      scheduleId: scheduleId ?? this.scheduleId,
    );
  }
}
