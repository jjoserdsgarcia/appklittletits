class Service {
  final String id;
  final String nome;
  final String descricao;
  final double valor;

  Service({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.valor,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      valor: (map['valor'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'valor': valor,
    };
  }
}