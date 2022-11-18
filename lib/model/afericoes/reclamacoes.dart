

class Reclamacoes{
  int? id ;
  int idPaciente;
  final DateTime createAt;
  String reclamacao;

  Reclamacoes({
    this.id,
    required this.idPaciente,
    required this.createAt,
    required this.reclamacao
  });
}