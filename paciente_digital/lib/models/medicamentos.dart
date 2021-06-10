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

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id' : id,
      'idPaciente' : idPaciente,
      'dataInicio': dataInicio,
      'dataFim' : dataFim,
      'nome': nome,
    };
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