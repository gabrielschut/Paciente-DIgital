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

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id' : id,
      'idPaciente' : idPaciente,
      'glicemia': glicemia,
      'date': date,
    };
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