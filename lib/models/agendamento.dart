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

  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
      id: map['id'],
      clienteId: map['cliente_id'],
      funcionarioId: map['funcionario_id'],
      servicoId: map['servico_id'],
      data: map['data'],
      hora: map['hora'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente_id': clienteId,
      'funcionario_id': funcionarioId,
      'servico_id': servicoId,
      'data': data,
      'hora': hora,
      'status': status,
    };
  }
}