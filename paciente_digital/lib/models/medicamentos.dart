class Medicamento {
  int id;
  int idPaciente;
  String nome;
  DateTime dataInicio;
  DateTime dataFim;

  Medicamento([
    this.id,
    this.idPaciente,
    this.nome,
    this.dataInicio,
    this.dataFim,
]);

  int get idMedicamento{
    return id;
  }

  String get nomeMedicamento{
    return nome;
  }

  DateTime get comecou{
    return dataInicio;
}

  DateTime get parou{
  return dataFim;
  }

  DateTime setDataFim(DateTime novaData){
    return dataFim = novaData;
  }

  Future<Map<String, dynamic>> toMap() async {
    var map = Map<String,dynamic>();
    map['id'] = id;
    map['idPaciente'] = idPaciente;
    map['nome'] = nome;
    map['dataInicio'] = dataInicio;
    map['dataFim'] = dataFim;
    return map;
  }

  Future<Medicamento> fromMap(Map<String, dynamic> map) async{
    Medicamento item;
    item.id = map['id'];
    item.nome = map['nome'];
    item.idPaciente = map['idPaciente'];
    item.dataInicio = map['dataInicio'];
    item.dataFim = map['dataFim'];

    return item;
  }

}