class CircunferenciaAbdominal{
  int id;
  int idPaciente;
  double circunferencia;
  DateTime date;

  CircunferenciaAbdominal([
    this.id,
    this.idPaciente,
    this.circunferencia
]);

  double get medidaCircunferencia{
    return circunferencia;
  }

  Future<Map<String, dynamic>> toMap() async {
    var map = Map<String,dynamic>();
    map['id'] = id;
    map['idPaciente'] = idPaciente;
    map['circunferencia'] = circunferencia;
    map['date'] = date;
    return map;
  }

  Future<CircunferenciaAbdominal> fromMap(Map<String, dynamic> map) async{
    CircunferenciaAbdominal item;
    item.id = map['id'];
    item.idPaciente = map['idPaciente'];
    item.circunferencia = map['circunferencia'];
    item.date = map['date'];

    return item;
  }
}