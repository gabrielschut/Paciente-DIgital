import 'dart:convert';

class PressaoArterial {

  List<PressaoArterial> pressaoArterialFromJson(String string) =>
      List<PressaoArterial>.from(jsonDecode(string).map((e)=> PressaoArterial.fromJson(e)));

  String pressaoArterialToJson(List<PressaoArterial> data) =>
    jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int? id;
  int idPaciente;
  final DateTime createAt;
  int maxima;
  int minima;

  factory PressaoArterial.fromJson(Map<String, dynamic> json) =>
      PressaoArterial(
        id: json["id"],
        idPaciente: json["idPaciente"],
        createAt: json["createAt"],
        maxima: json["maxima"],
        minima: json["minima"],
      );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "idPaciente": idPaciente,
    "createAt": createAt,
    "maxima": maxima,
    "minima": minima
  };
  
  PressaoArterial(
      {this.id,
      required this.idPaciente,
      required this.createAt,
      required this.maxima,
      required this.minima});

}
