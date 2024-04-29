
class Medicamento {

  int idPaciente;
  int id = 0;
  String nome;
  double dosagem;
  String? tarja;
  int dataInicial;
  int? diasDeUso;

  Medicamento(
      {required this.id,
      required this.idPaciente,
      required this.nome,
      required this.dosagem,
        this.tarja,
      required this.dataInicial,
      required this.diasDeUso});

}
