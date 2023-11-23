import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/glicemia.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class GlicemiaRepository extends ChangeNotifier{

  late Database db;

  GlicemiaRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _listAll();
  }

  _create(
      int pacientId, DateTime? createAt, int value) async {
    final db = await DataBaseService.instance.database;
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

  _get(int id) async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> glicemia =
        db.query('glicemia', where: "id = ?", whereArgs: [id], limit: 1);
    return glicemia;
  }

   _getAll() async {
     final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> glicemia =
        db.query('glicemia', orderBy: 'id');
    return glicemia;
  }

  _update(
      int id, int pacientId, DateTime? createAt, int value) async {
    final db = await DataBaseService.instance.database;
    final glicemia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'value': value
    };
    final result = db.update('glicemia', glicemia, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  _delete(int id) async {
    final db = await DataBaseService.instance.database;
    try {
      db.delete('glicemia', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  _listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<Glicemia> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> glicemia in dbResp) {
        response.add(Glicemia(
            id: glicemia['id'],
            idPaciente: glicemia['paciente_id'],
            createAt: glicemia['createA'],
            value: glicemia['value']));
      }
    }
    return response;
  }

  _getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return Glicemia(
        id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        value: dbResp[0]['value']);
  }
}