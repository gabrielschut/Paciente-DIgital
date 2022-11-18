class PacienteResponse {
  int id;
  String nome;
  String sobrenome;
  String sexo;
  int idade;
  bool diabetes;
  bool cardicado;

  PacienteResponse({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.sexo,
    required this.idade,
    required this.diabetes,
    required this.cardicado
  });
}
