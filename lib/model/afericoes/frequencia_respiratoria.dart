class FrequenciaRespiratoria{
  int? id;
  int idPaciente;
  DateTime createAt ;
  int frequencia;

  FrequenciaRespiratoria({
    this.id,
    required this.createAt,
    required this.idPaciente,
    required this.frequencia
  });

}