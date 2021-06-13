class Peso {
  int id;
  int idPaciente;
  double peso;
  DateTime date;

  Peso([
    this.id,
    this.idPaciente,
    this.peso,
  ]);

  double get quantoPesa {
    return peso;
  }

  Future<Map<String, dynamic>> toMap() async {
    var map = Map<String,dynamic>();
    map['id'] = id;
    map['idPaciente'] = idPaciente;
    map['peso'] = peso;
    map['date'] = date;
    return map;
  }

  Future<Peso> fromMap(Map<String, dynamic> map) async{
    Peso item;
    item.id = map['id'];
    item.idPaciente = map['idPaciente'];
    item.peso = map['peso'];
    item.date = map['date'];

    return item;
  }
}
