import 'dart:core';

class Paciente {

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "idade": idade,
        "sexo": sexo,
        "altura": altura,
        "peso": peso,
        "tipoSanguineo": tipoSanguineo,
        "circunferenciaAbdominal": circunferenciaAbdominal,
      };

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

  Paciente copy({
    int? id,
    String? nome,
    String? sexo,
    int? idade,
    String? tipoSanguineo,
    double? peso,
    double? altura,
    double? circunferenciaAbdominal,
    bool? isActive,
  }) =>
      Paciente(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        sexo: sexo ?? this.sexo,
        idade: idade ?? this.idade,
        tipoSanguineo: tipoSanguineo ?? this.tipoSanguineo,
        peso: peso ?? this.peso,
        altura: altura ?? this.altura,
        circunferenciaAbdominal:
            circunferenciaAbdominal ?? this.circunferenciaAbdominal,
      );
}
