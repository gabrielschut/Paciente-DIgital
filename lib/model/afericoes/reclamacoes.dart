import 'dart:convert';

class Reclamacoes {

  List<Reclamacoes> reclamacoesFromJson(String string) =>
      List<Reclamacoes>.from(jsonDecode(string).map((e)=> Reclamacoes.fromJson(e)));

  String reclamacoesToJson(List<Reclamacoes> data) =>
      jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int? id;
  int idPaciente;
  final DateTime createAt;
  String reclamacao;

  factory Reclamacoes.fromJson(Map<String, dynamic> json) => Reclamacoes(
        id: json["id"],
        idPaciente: json["idPaciente"],
        createAt: json["createAt"],
        reclamacao: json["reclamacao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idPaciente": idPaciente,
        "createAt": createAt,
        "reclamacao": reclamacao
      };

  Reclamacoes(
      {this.id,
      required this.idPaciente,
      required this.createAt,
      required this.reclamacao});
}
