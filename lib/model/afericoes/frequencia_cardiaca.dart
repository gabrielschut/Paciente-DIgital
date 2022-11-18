class FrenquenciaCardiaca {
  int? id;
  int idPaciente;
  DateTime createAt;
  double frequencia;

  FrenquenciaCardiaca({
    this.id,
    required this.idPaciente,
    required this.createAt,
    required this.frequencia
  });
}
