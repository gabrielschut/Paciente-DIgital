import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;
class FrequenciaRespiratoriaRepository extends ChangeNotifier{

  Future<int> create(int pacientId, int createAt, double valor) async {
    final db = await DataBaseService.database();
    final frequencia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'frequencia': valor
    };
    int id = await db.insert('frequencia_respiratoria', frequencia,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<List<Map<String,dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> frequencia = db.query(
        'frequencia_respiratoria',
        where: "id = ?",
        whereArgs: [id],
        limit: 1);
    return frequencia;
  }

  Future<List<Map<String,dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> frequencia =
        db.query('frequencia_respiratoria', orderBy: 'id');
    return frequencia;
  }

  Future<int> update(int id, int pacientId, DateTime? createAt, double valor) async {
    final db = await DataBaseService.database();
    final frequencia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'frequencia': valor
    };
    final result = db.update('frequencia_respiratoria', frequencia,
        where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  Future<void> delete(int id) async {
    final db = await DataBaseService.database();
    try {
      db.delete('frequencia_respiratoria', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  Future<List<FrequenciaRespiratoria>> listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<FrequenciaRespiratoria> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> frequencia in dbResp) {
        response.add(FrequenciaRespiratoria(
            id: frequencia['id'],
            createAt: frequencia['createAt'],
            idPaciente: frequencia['paciente_id'],
            frequencia: frequencia['frequencia']));
      }
    }
    return response;
  }

  Future<FrequenciaRespiratoria> getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return FrequenciaRespiratoria(
        id: dbResp[0]['id'],
        createAt: dbResp[0]['createAt'],
        idPaciente: dbResp[0]['paciente_id'],
        frequencia: dbResp[0]['frequencia']);
  }
}
