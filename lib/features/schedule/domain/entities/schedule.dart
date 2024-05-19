class Schedule {
  final int id;
  final int dayId;
  final String? dayName;
  final int splitId;
  final String? splitName;

  Schedule({
    required this.id,
    required this.dayId,
    this.dayName,
    required this.splitId,
    this.splitName,
  });
}
