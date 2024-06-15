import 'package:gym8/features/exercise/domain/entities/difficulty.dart';
import 'package:gym8/features/exercise/domain/entities/equipment.dart';
import 'package:gym8/features/exercise/domain/entities/muscle.dart';
import 'package:gym8/features/exercise/domain/entities/type.dart';

class Exercise {
  final int id;
  final String name;
  final String instruction;
  final Muscle muscle;
  final Type type;
  final Equipment equipment;
  final Difficulty difficulty;

  Exercise({
    required this.id,
    required this.name,
    required this.instruction,
    required this.muscle,
    required this.type,
    required this.equipment,
    required this.difficulty,
  });
}
