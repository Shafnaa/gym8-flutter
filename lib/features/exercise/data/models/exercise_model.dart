import 'package:gym8/features/exercise/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.id,
    required super.name,
    required super.instruction,
    required super.muscleId,
    super.muscleName,
    super.muscleImageUrl,
    required super.typeId,
    super.typeName,
    required super.equipmentId,
    super.equipmentName,
    required super.difficultyId,
    super.difficultyName,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'instruction': instruction,
      'muscle_id': muscleId,
      'type_id': typeId,
      'equipment_id': equipmentId,
      'difficulty_id': difficultyId,
    };
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> map) {
    return ExerciseModel(
      id: map['id'] as int,
      name: map['name'] as String,
      instruction: map['instruction'] as String,
      muscleId: map['muscle_id'] as int,
      typeId: map['type_id'] as int,
      equipmentId: map['equipment_id'] as int,
      difficultyId: map['difficulty_id'] as int,
    );
  }

  ExerciseModel copyWith({
    int? id,
    String? name,
    String? instruction,
    int? muscleId,
    String? muscleName,
    String? muscleImageUrl,
    int? typeId,
    String? typeName,
    int? equipmentId,
    String? equipmentName,
    int? difficultyId,
    String? difficultyName,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      instruction: instruction ?? this.instruction,
      muscleId: muscleId ?? this.muscleId,
      muscleName: muscleName ?? this.muscleName,
      muscleImageUrl: muscleImageUrl ?? this.muscleImageUrl,
      typeId: typeId ?? this.typeId,
      typeName: typeName ?? this.typeName,
      equipmentId: equipmentId ?? this.equipmentId,
      equipmentName: equipmentName ?? this.equipmentName,
      difficultyId: difficultyId ?? this.difficultyId,
      difficultyName: difficultyName ?? this.difficultyName,
    );
  }
}
