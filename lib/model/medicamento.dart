class Medicamento {

  int idPaciente;
  int? id = 0;
  String nome;
  double dosagem;
  DateTime dataInicial;
  DateTime dataTermino;

  Medicamento({
    this.id,
    required this.idPaciente,
    required this.nome,
    required this.dosagem,
    required this.dataInicial,
    required this.dataTermino
  });

}