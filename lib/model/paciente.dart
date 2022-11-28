import 'dart:convert';
import 'dart:core';

class Paciente {

  List<Paciente> pacienteFromJson(String str) =>
    List<Paciente>.from(jsonDecode(str).map((x) => Paciente.fromJson(x)));

  String pacienteToJson(List<Paciente> data) =>
   json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory Paciente.fromJson(Map<String, dynamic> json) => Paciente(
    nome: json['nome'],
    idade: json['idade'],
    sexo: json['sexo'],
    altura: json['altura'],
    peso: json['peso'],
    tipoSanguineo: json['tipoSanguineo'],
    diabetis: json['diabetis'],
    cardiaco: json['cardiaco'],
    circunferenciaAbdominal: json['circunferenciaAbdominal'],
    isActive: json['isActive'],
    id: json['id']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "idade": idade,
    "sexo": sexo,
    "altura": altura,
    "peso": peso,
    "tipoSanguineo": tipoSanguineo,
    "diabetis": diabetis,
    "cardiaco": cardiaco,
    "circunferenciaAbdominal": circunferenciaAbdominal,
    "isActive": isActive
  };

  int? id;
  String nome = "";
  String sexo = "";
  int idade = 0;
  String? tipoSanguineo;
  double? peso;
  double? altura;
  bool diabetis;
  bool cardiaco;
  double? circunferenciaAbdominal;
  bool isActive = true;

  Paciente({
    this.id,
    required this.nome,
    required this.sexo,
    required this.idade,
    this.tipoSanguineo,
    this.peso,
    this.altura,
    required this.diabetis,
    required this.cardiaco,
    this.circunferenciaAbdominal,
    this.isActive = true
  });
}
