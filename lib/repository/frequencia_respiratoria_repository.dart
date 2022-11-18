import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'package:sqflite/sqflite.dart';
import '../db/database.dart';

class FreqRespiratoriaRepository extends ChangeNotifier {
  late Database db;

  void _create(FrequenciaRespiratoria freqRespiratoria) async {
    db = await AppDatabase.instance.database;

    db.insert('frequencia_respiratoria', {
      'id_paciente': freqRespiratoria.idPaciente,
      'create_at': freqRespiratoria.createAt,
      'frequencia': freqRespiratoria.frequencia,
    });
    notifyListeners();
  }

  void _deleteById(int id) async{
    db = await AppDatabase.instance.database;
    db.delete('frequencia_respiratoria', where: "frequencia_respiratoria.id = {$id}");
    notifyListeners();
  }

  Future<List<FrequenciaRespiratoria>> _getAllByPacienteId(int pacienteId) async {
    db = await AppDatabase.instance.database;
    List afericoes = await db.query('frequencia_respiratoria',
        where: "frequencia_respiratoria.id_paciente in ({$pacienteId})");
    List<FrequenciaRespiratoria> frequenciasRespiratorias = [];

    afericoes.forEach((element) {
      FrequenciaRespiratoria frequenciaRespiratoria = FrequenciaRespiratoria(
          id: element['id'],
          createAt: element['id_paciente'],
          idPaciente: element['create_at'],
          frequencia: element['frequencia']);
      frequenciasRespiratorias.add(frequenciaRespiratoria);
    });
    notifyListeners();
    return frequenciasRespiratorias;
  }

}