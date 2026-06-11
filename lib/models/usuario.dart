class Usuario {
  final String id;
  final String nome;
  final String email;
  final String tipoUsuario;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.tipoUsuario,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      tipoUsuario: map['tipo_usuario'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'tipo_usuario': tipoUsuario,
    };
  }
}


