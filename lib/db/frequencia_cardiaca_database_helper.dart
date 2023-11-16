import 'package:paciente_digital/model/afericoes/frequencia_cardiaca.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FrequenciaCardiacaDatabaseHelper {
  static Future<int> create(
      int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.openDatabase();
    final frequenciaCardiaca = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'frequencia': frequencia
    };
    int id = await db.insert('frequencia_respiratoria', frequenciaCardiaca,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String, dynamic>>> frequencia = db.query(
        'frequencia_respiratoria',
        where: "id = ?",
        whereArgs: [id],
        limit: 1);
    db.close();
    return frequencia;
  }

  static Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String, dynamic>>> frequencia =
        db.query('frequencia_respiratoria', orderBy: 'id');
    db.close();
    return frequencia;
  }

  static Future<int> update(
      int id, int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.openDatabase();
    final frequenciaCardiaca = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'frequencia': frequencia
    };
    final result = db.update('frequencia_respiratoria', frequenciaCardiaca,
        where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseService.openDatabase();
    try {
      db.delete('frequencia_respiratoria', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    db.close();
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
            frequencia: frequencia['frequencia']));
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
        frequencia: dbResp[0]['frequencia']);
  }
}
