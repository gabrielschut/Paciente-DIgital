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

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'idPaciente': idPaciente,
      'pressaoMax': pressaoMax,
      'pressaoMin': pressaoMin,
      'date': date,
    };
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
