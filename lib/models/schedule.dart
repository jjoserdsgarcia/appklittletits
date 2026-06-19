class Schedule {
  final String id;
  final String userId;
  final int dayOftheWeek;
  final String initialHour;
  final String finalHour;

  Schedule({
    required this.id,
    required this.userId,
    required this.dayOftheWeek,
    required this.initialHour,
    required this.finalHour,
  });
}
