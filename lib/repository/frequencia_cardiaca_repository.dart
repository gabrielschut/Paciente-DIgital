import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../db/database.dart';
import '../model/afericoes/frequencia_cardiaca.dart';

class FrequenciaCardiacaRepository extends ChangeNotifier {
  late Database db;

  void _create(FrenquenciaCardiaca frequenciaCardiaca) async {
    db = await AppDatabase.instance.database;

    db.insert('frequecia_cardiaca', {
      'id_paciente': frequenciaCardiaca.idPaciente,
      'create_at': frequenciaCardiaca.createAt,
      'frequencia': frequenciaCardiaca.createAt,
    });
    notifyListeners();
  }

  void _deleteById(int id) async {
    db = await AppDatabase.instance.database;

    db.delete("frequecia_cardiaca", where: "frequecia_cardiaca.id = {$id}");
    notifyListeners();
  }

  Future<List<FrenquenciaCardiaca>> _getAllByPacienteId(int pacienteId) async {
    db = await AppDatabase.instance.database;
    List afericoes = await db.query('frequecia_cardiaca',
        where: "frequecia_cardiaca.id_paciente in ({$pacienteId})");

    List<FrenquenciaCardiaca> allFreqCardiaca = [];
    afericoes.forEach((element) {
      FrenquenciaCardiaca frenquenciaCardiaca = FrenquenciaCardiaca(
          id: element['id'],
          idPaciente: element['id_paciente'],
          createAt: element['create_at'],
          frequencia: element['frequencia']);
      allFreqCardiaca.add(frenquenciaCardiaca);
    });
    notifyListeners();
    return allFreqCardiaca;
  }
}