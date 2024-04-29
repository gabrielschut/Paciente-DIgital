import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/frequencia_cardiaca.dart';
import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FrequenciaCardiacaRepository extends ChangeNotifier{

  Future<int> create(int pacientId, int createAt, double frequencia) async {
    final db = await DataBaseService.database();
    final frequenciaCardiaca = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'batimentos': frequencia
    };
    int id = await db.insert('frequencia_cardiaca', frequenciaCardiaca,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> frequencia = db.query(
        'frequencia_cardiaca',
        where: "id = ?",
        whereArgs: [id],
        limit: 1);
    return frequencia;
  }

  Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> frequencia =
        db.query('frequencia_cardiaca', orderBy: 'id');
    return frequencia;
  }

  Future<int> update(
      int id, int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.database();
    final frequenciaCardiaca = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'batimentos': frequencia
    };
    final result = db.update('frequencia_cardiaca', frequenciaCardiaca,
        where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  Future<void> delete(int id) async {
    final db = await DataBaseService.database();
    try {
      db.delete('frequencia_cardiaca', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

   Future<List<FrenquenciaCardiaca>> listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<FrenquenciaCardiaca> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> frequencia in dbResp) {
        response.add(FrenquenciaCardiaca(
            id: frequencia['id'],
            idPaciente: frequencia['paciente_id'],
            createAt: frequencia['createAt'],
            frequencia: frequencia['batimentos']));
      }
    }
    return response;
  }

  Future<FrenquenciaCardiaca> getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return FrenquenciaCardiaca(
        id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        frequencia: dbResp[0]['batimentos']);
  }
}
