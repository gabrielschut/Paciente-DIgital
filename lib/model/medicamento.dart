import 'dart:convert';

class Medicamento {

  List<Medicamento> medicamenFromJson(String string) =>
      List<Medicamento>.from(
          jsonDecode(string).map((x) => Medicamento.fromJson(x)));

  String medicamentoToJson(List<Medicamento> data) =>
      jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int idPaciente;
  int? id = 0;
  String nome;
  double dosagem;
  String tarja;
  DateTime dataInicial;
  DateTime dataTermino;

  factory Medicamento.fromJson(Map<String, dynamic> json) =>
      Medicamento(
          id: json['id'],
          idPaciente: json['idPaciente'],
          nome: json['nome'],
          dosagem: json['dosagem'],
          tarja: json['tarja'],
          dataInicial: json['dataInicial'],
          dataTermino: json['dataTermino']);

  Map<String, dynamic> toJson() => {
    "id": id,
    "idPaciente": idPaciente,
    "nome": nome,
    "dosagem": dosagem,
    "tarja": tarja,
    "dataInicial": dataInicial,
    "dataTermino": dataTermino
  };

  Medicamento({
    this.id,
    required this.idPaciente,
    required this.nome,
    required this.dosagem,
    required this.tarja,
    required this.dataInicial,
    required this.dataTermino
  });

}