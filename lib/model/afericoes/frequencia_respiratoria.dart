import 'dart:convert';

class FrequenciaRespiratoria {

  List<FrequenciaRespiratoria> freqRespiratoriaFromJson(String string) =>
    List<FrequenciaRespiratoria>.from(jsonDecode(string).map((e) => FrequenciaRespiratoria.fromJson(e)));

  String freqRespiratoriaToJson(List<FrequenciaRespiratoria> data)=>
    jsonEncode(List<dynamic>.from(data.map((e) => e.toJson())));

  int? id;
  int idPaciente;
  DateTime createAt;
  int frequencia;

  factory FrequenciaRespiratoria.fromJson(Map<String, dynamic> json) =>
      FrequenciaRespiratoria(
        id: json["id"],
        createAt: json["createAt"],
        idPaciente: json["idPaciente"],
        frequencia: json["frequencia"],
      );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "idPaciente": idPaciente,
    "createAt": createAt,
    "frequencia": frequencia,
  };


  FrequenciaRespiratoria(
      {this.id,
      required this.createAt,
      required this.idPaciente,
      required this.frequencia});
}
