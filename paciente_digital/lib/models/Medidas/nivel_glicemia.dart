class NivelGlicemia{
  int id;
  int idPaciente;
  double glicemia;
  DateTime date;

  NivelGlicemia([
    this.id,
    this.idPaciente,
    this.glicemia,
]);
  //Retorna a medida salva da glicemia
  double get nivelDaGlivemia{
    return glicemia;
  }

  Future<Map<String, dynamic>> toMap() async {
    var map = Map<String,dynamic>();
    map['id'] = id;
    map['idPaciente'] = idPaciente;
    map['glicemia'] = glicemia;
    map['date'] = date;
    return map;
  }

  Future<NivelGlicemia> fromMap(Map<String, dynamic> map) async{
    NivelGlicemia item;
    item.id = map['id'];
    item.idPaciente = map['idPaciente'];
    item.glicemia = map['glicemia'];
    item.date = map['date'];
    return item;
  }
}