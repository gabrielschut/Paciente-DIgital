import 'package:flutter/cupertino.dart';

class Paciente{
  final String nome;
  final String sexo;
  final int idade;
  final bool isDiabetico;
  final bool isHipertenso;

  Paciente({
    @required this.nome,
    @required this.sexo,
    @required this.idade,
    this.isHipertenso,
    this.isDiabetico,
});

}