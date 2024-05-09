class Exercise {
  final int id;
  final String name;
  final String instruction;
  final int muscleId;
  final String? muscleName;
  final String? muscleImageUrl;
  final int typeId;
  final String? typeName;
  final int equipmentId;
  final String? equipmentName;
  final int difficultyId;
  final String? difficultyName;

  Exercise({
    required this.id,
    required this.name,
    required this.instruction,
    required this.muscleId,
    this.muscleName,
    this.muscleImageUrl,
    required this.typeId,
    this.typeName,
    required this.equipmentId,
    this.equipmentName,
    required this.difficultyId,
    this.difficultyName,
  });
}
