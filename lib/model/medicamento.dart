
class Medicamento {

  int idPaciente;
  int id = 0;
  String nome;
  double dosagem;
  String tarja;
  DateTime dataInicial;
  int? diasDeUso;

  Medicamento(
      {required this.id,
      required this.idPaciente,
      required this.nome,
      required this.dosagem,
      required this.tarja,
      required this.dataInicial,
      required this.diasDeUso});

}
