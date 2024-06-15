import 'package:gym8/features/exercise/domain/entities/difficulty.dart';
import 'package:gym8/features/exercise/domain/entities/equipment.dart';
import 'package:gym8/features/exercise/domain/entities/exercise.dart';
import 'package:gym8/features/exercise/domain/entities/muscle.dart';
import 'package:gym8/features/exercise/domain/entities/type.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.id,
    required super.name,
    required super.instruction,
    required super.muscle,
    required super.type,
    required super.equipment,
    required super.difficulty,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'instruction': instruction,
      'muscle_id': muscle.id,
      'type_id': type.id,
      'equipment_id': equipment.id,
      'difficulty_id': difficulty.id,
    };
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> map) {
    return ExerciseModel(
        id: map['id'] as int,
        name: map['name'] as String,
        instruction: map['instruction'] as String,
        muscle: Muscle(
          id: map['muscles']['id'] as int,
          name: map['muscles']['name'] as String,
          imageUrl: map['muscles']['image_url'] as String,
        ),
        type: Type(
          id: map['types']['id'] as int,
          name: map['types']['name'] as String,
        ),
        equipment: Equipment(
          id: map['equipments']['id'] as int,
          name: map['equipments']['name'] as String,
        ),
        difficulty: Difficulty(
          id: map['difficulties']['id'] as int,
          name: map['difficulties']['name'] as String,
        ));
  }

  ExerciseModel copyWith({
    int? id,
    String? name,
    String? instruction,
    Muscle? muscle,
    Type? type,
    Equipment? equipment,
    Difficulty? difficulty,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      instruction: instruction ?? this.instruction,
      muscle: muscle ?? this.muscle,
      type: type ?? this.type,
      equipment: equipment ?? this.equipment,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
