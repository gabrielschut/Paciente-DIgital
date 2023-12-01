import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/glicemia.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class GlicemiaRepository extends ChangeNotifier{

  Future<int> create(int pacientId, int createAt, double value) async {
    final db = await DataBaseService.database();
    final glicemia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'value': value
    };
    int id = await db.insert('glicemia', glicemia,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> glicemia =
        db.query('glicemia', where: "id = ?", whereArgs: [id], limit: 1);
    return glicemia;
  }

   Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> glicemia =
        db.query('glicemia', orderBy: 'id');
    return glicemia;
  }

  Future<int> update(int id, int pacientId, DateTime? createAt, int value) async {
    final db = await DataBaseService.database();
    final glicemia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'value': value
    };
    final result = db.update('glicemia', glicemia, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  Future<void> delete(int id) async {
    final db = await DataBaseService.database();
    try {
      db.delete('glicemia', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  Future<List<Glicemia>> listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<Glicemia> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> glicemia in dbResp) {
        response.add(Glicemia(
            id: glicemia['id'],
            idPaciente: glicemia['paciente_id'],
            createAt: glicemia['createAt'],
            value: glicemia['value']));
      }
    }
    return response;
  }

  Future<Glicemia> getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return Glicemia(
        id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        value: dbResp[0]['value']);
  }
}
