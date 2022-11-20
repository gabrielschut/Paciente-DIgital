class PressaoArterial {
  int? id;
  int idPaciente;
  final DateTime createAt;
  int maxima;
  int minima;

  PressaoArterial(
      {this.id,
      required this.idPaciente,
      required this.createAt,
      required this.maxima,
      required this.minima});
}
