import 'dart:core';

class Paciente{

  int id;
  String nome = "";
  String sexo = "";
  int idade = 0;
  String? tipoSanguineo;
  double? peso;
  double? altura;
  double? circunferenciaAbdominal;

  Paciente(
      {
      required this.id,
      required this.nome,
      required this.sexo,
      required this.idade,
      this.tipoSanguineo,
      this.peso,
      this.altura,
      this.circunferenciaAbdominal});

}
