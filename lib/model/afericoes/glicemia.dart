import 'dart:convert';

class Glicemia {

  List<Glicemia> flicemiaFromJson(String string) =>
    List<Glicemia>.from(jsonDecode(string).map((e)=> Glicemia.fromJson(e)));

  String glicemiaToJson(List<Glicemia> data) =>
    jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int? id;
  int idPaciente;
  DateTime createA;
  double value;

  factory Glicemia.fromJson(Map<String, dynamic> json) => Glicemia(
        id: json["id"],
        idPaciente: json["idPaciente"],
        createA: json["createA"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "idPaciente": idPaciente,
    "createA": createA,
    "value": value
  };

  Glicemia(
      {this.id,
      required this.idPaciente,
      required this.createA,
      required this.value});
}
