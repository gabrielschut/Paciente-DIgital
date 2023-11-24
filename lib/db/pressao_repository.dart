import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/pressao_arterial.dart';
import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class PressaoArterialRepository extends ChangeNotifier{

  Future<int> create(int pacientId, DateTime? createAt, int max, int min) async {
    final db = await DataBaseService.database();
    final pressao = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'maxima': max,
      'minima': min
    };
    int id = await db.insert('pressao_arterial', pressao, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> pressao = db.query(
        'pressao_arterial', where: "id = ?", whereArgs: [id], limit: 1);
    return pressao;
  }

  Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> pressao = db.query(
        'pressao_arterial', orderBy: 'id');
    return pressao;
  }

  Future<int> update(int id, int pacientId, DateTime? createAt, int max,
      int min) async {
    final db = await DataBaseService.database();
    final pressao = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'maxima': max,
      'minima': min
    };
    final result = db.update(
        'pressao_arterial', pressao, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  Future<void> delete(int id) async {
    final db = await DataBaseService.database();
    try {
      db.delete('pressao_arterial', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  Future<List<PressaoArterial>> listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<PressaoArterial> response = [];
    if (dbResp.isNotEmpty) {
      for(Map<String, dynamic> pressao in dbResp){
        response.add(PressaoArterial(id: pressao['id'],
            idPaciente: pressao['paciente_id'],
            createAt: pressao['createAt'],
            maxima: pressao['maxima'],
            minima: pressao['minima']));
      }
    }
    return response;
  }

  Future<PressaoArterial> getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return PressaoArterial(id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        maxima: dbResp[0]['maxima'],
        minima: dbResp[0]['minima']);
  }
}