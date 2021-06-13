class PressaoArterial {
  int id;
  int idPaciente;
  double pMaxima;
  double pMinima;
  DateTime date;

  PressaoArterial([
    this.id,
    this.idPaciente,
    this.pMaxima,
    this.pMinima,
  ]);

  //Retorna a Maxima da pressão
  double get pressaoMax {
    return pMaxima;
  }

  //Retorna a minima da pressão
  double get pressaoMin {
    return pMinima;
  }

  //Retorna quando foi tirada a pressão
  DateTime get dataPressao {
    return date;
  }

  Future<Map<String, dynamic>> toMap() async {
    var map = Map<String,dynamic>();
    map['id'] = id;
    map['idPaciente'] = idPaciente;
    map['pMaxima'] = pMaxima;
    map['pMinima'] = pMinima;
    map['date'] = date;
    return map;
  }

  Future<PressaoArterial> fromMap(Map<String, dynamic> map) async{
    PressaoArterial item;
    item.id = map['id'];
    item.idPaciente = map['idPaciente'];
    item.pMaxima = map['pMaxima'];
    item.pMinima = map['pMinima'];
    item.date = map['date'];

    return item;
  }
}
