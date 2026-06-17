class Agendamento {
  final String id;
  final String clienteId;
  final String funcionarioId;
  final String servicoId;
  final String data;
  final String hora;
  final String status;

  Agendamento({
    required this.id,
    required this.clienteId,
    required this.funcionarioId,
    required this.servicoId,
    required this.data,
    required this.hora,
    required this.status,
  });
}
