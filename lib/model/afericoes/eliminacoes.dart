import 'dart:convert';

class Eliminacoes {
  List<Eliminacoes> eliminacoesFromJson(String string) =>
      List<Eliminacoes>.from(
          jsonDecode(string).map((e) => Eliminacoes.fromJson(e)));

  String eliminacoesToJson(List<Eliminacoes> data) =>
      jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int? id;
  int idPaciente;
  DateTime createAt;
  String? excrecao;
  String? description;

  factory Eliminacoes.fromJson(Map<String, dynamic> json) => Eliminacoes(
      id:  json["id"],
      idPaciente: json["idPaciente"],
      createAt: json["createAt"],
      excrecao: json["excrecao"],
      description: json["description"]);

  Map<String, dynamic> toJson()=>
      {
        "id": id,
        "idPaciente": idPaciente,
        "createAt": createAt,
        "excrecao": excrecao,
        "description": description
      };

  Eliminacoes(
      {this.id,
      required this.idPaciente,
      required this.createAt,
      required this.excrecao,
      required this.description});
}
