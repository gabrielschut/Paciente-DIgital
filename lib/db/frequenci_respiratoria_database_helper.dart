import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FrequenciaRespiratoriaDatabaseHelper {
  static Future<int> create(
      int pacientId, DateTime? createAt, double batimentos) async {
    final db = await DataBaseService.openDatabase();
    final frequencia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'batimentos': batimentos
    };
    int id = await db.insert('frequecia_cardiaca', frequencia,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String, dynamic>>> frequencia = db.query(
        'frequecia_cardiaca',
        where: "id = ?",
        whereArgs: [id],
        limit: 1);
    db.close();
    return frequencia;
  }

  static Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String, dynamic>>> frequencia =
        db.query('frequecia_cardiaca', orderBy: 'id');
    db.close();
    return frequencia;
  }

  static Future<int> update(
      int id, int pacientId, DateTime? createAt, double batimentos) async {
    final db = await DataBaseService.openDatabase();
    final frequencia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'batimentos': batimentos
    };
    final result = db.update('frequecia_cardiaca', frequencia,
        where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseService.openDatabase();
    try {
      db.delete('frequecia_cardiaca', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    db.close();
  }

  static Future<List<FrequenciaRespiratoria>> listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<FrequenciaRespiratoria> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> frequencia in dbResp) {
        response.add(FrequenciaRespiratoria(
            id: frequencia['id'],
            createAt: frequencia['createAt'],
            idPaciente: frequencia['idPaciente'],
            frequencia: frequencia['frequencia']));
      }
    }
    return response;
  }

  static Future<FrequenciaRespiratoria> getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return FrequenciaRespiratoria(
        id: dbResp[0]['id'],
        createAt: dbResp[0]['createAt'],
        idPaciente: dbResp[0]['idPaciente'],
        frequencia: dbResp[0]['frequencia']);
  }
}
