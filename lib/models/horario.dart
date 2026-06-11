class Horario {
  final String id;
  final String funcionarioId;
  final int diaSemana;
  final String horaInicio;
  final String horaFim;

  Horario({
    required this.id,
    required this.funcionarioId,
    required this.diaSemana,
    required this.horaInicio,
    required this.horaFim,
  });

  factory Horario.fromMap(Map<String, dynamic> map) {
    return Horario(
      id: map['id'],
      funcionarioId: map['funcionario_id'],
      diaSemana: map['dia_semana'],
      horaInicio: map['hora_inicio'],
      horaFim: map['hora_fim'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'funcionario_id': funcionarioId,
      'dia_semana': diaSemana,
      'hora_inicio': horaInicio,
      'hora_fim': horaFim,
    };
  }
}