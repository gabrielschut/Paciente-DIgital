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

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'idPaciente': idPaciente,
      'peso': peso,
      'date': date,
    };
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
