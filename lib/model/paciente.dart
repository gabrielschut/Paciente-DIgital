import 'dart:core';

class Paciente {
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
