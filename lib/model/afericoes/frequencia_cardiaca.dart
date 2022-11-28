import 'dart:convert';

class FrenquenciaCardiaca {

  List<FrenquenciaCardiaca> freqCardiacaFromJson(String string) =>
    List<FrenquenciaCardiaca>.from(jsonDecode(string).map((e)=> FrenquenciaCardiaca.fromJson(e)));

  String freqCardiacaToJson(List<FrenquenciaCardiaca> data) =>
    jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int? id;
  int idPaciente;
  DateTime createAt;
  double frequencia;

  factory FrenquenciaCardiaca.fromJson(Map<String, dynamic> json) =>
      FrenquenciaCardiaca(
        id: json["id"],
        idPaciente: json["idPaciente"],
        createAt: json["createAt"],
        frequencia: json["frequencia"],
      );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "idPaciente": idPaciente,
    "createAt": createAt,
    "frequencia": frequencia,
  };

  FrenquenciaCardiaca(
      {this.id,
      required this.idPaciente,
      required this.createAt,
      required this.frequencia});
}
