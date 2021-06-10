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

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id' : id,
      'idPaciente' : idPaciente,
      'circunferencia': circunferencia,
      'date': date,
    };
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