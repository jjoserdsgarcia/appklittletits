class Booking {
  final String id;
  final String clientId;
  final String employeeId;
  final String serviceId;
  final String date;
  final String hour;
  final String status;

  Booking({
    required this.id,
    required this.clientId,
    required this.employeeId,
    required this.serviceId,
    required this.date,
    required this.hour,
    required this.status,
  });
}
