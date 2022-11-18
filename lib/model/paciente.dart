import 'dart:core';

class Paciente {
  int? id;
  String nome = "";
  String sobrenome = "";
  String sexo = "";
  int idade = 0;
  String? tipoSanguineo;
  double? peso;
  bool diabetis;
  bool cardiaco;
  double? circunferenciaAbdominal;
  bool isActive = true;

  Paciente({
    this.id,
    required this.nome,
    required this.sobrenome,
    required this.sexo,
    required this.idade,
    this.tipoSanguineo,
    this.peso,
    required this.diabetis,
    required this.cardiaco,
    this.circunferenciaAbdominal,
    this.isActive = true
  });
}
