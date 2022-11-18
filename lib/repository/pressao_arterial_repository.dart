import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';
import 'package:sqflite/sqflite.dart';

import '../db/database.dart';

class PressaoArterialRepository extends ChangeNotifier {
  late Database db;

  void _crete(PressaoArterial pressaoArterial) async {
    db = await AppDatabase.instance.database;
    db.insert('pressao_arterial', {
      'id': pressaoArterial.id,
      'id_paciente': pressaoArterial.idPaciente,
      'create_at': pressaoArterial.createAt,
      'maxima': pressaoArterial.maxima,
      'minima': pressaoArterial.minima
    });
    notifyListeners();
  }

  void _deleteById(int id) async {
    db = await AppDatabase.instance.database;
    db.delete('pressao_arterial', where: "pressao_arterial.id = {$id}");
    notifyListeners();
  }

  Future<List<PressaoArterial>> _getAllByPacienteId(int pacienteId) async {
    db = await AppDatabase.instance.database;
    List pressoesArteeriais = await db.query('pressao_arterial', where: "pressao_arterial.id_paciente in ({$pacienteId})");
    List<PressaoArterial> allPressoes = [];

    pressoesArteeriais.forEach((element) {
      PressaoArterial pressaoArterial = PressaoArterial(
          id: element['id'],
          idPaciente: element['id_paciente'],
          createAt: element['create_at'],
          maxima: element['maxima'],
          minima: element['minima']);
      allPressoes.add(pressaoArterial);
    });
    notifyListeners();
    return allPressoes;
  }


}
