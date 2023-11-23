import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/frequencia_respiratoria.dart';
import 'package:sqflite/sqlite_api.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;
class FrequenciaRespiratoriaRepository extends ChangeNotifier{

  late Database db;

  FrequenciaRespiratoriaRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _listAll();
  }

  _create(int pacientId, DateTime? createAt, double batimentos) async {
    final db = await DataBaseService.instance.database;
    final frequencia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'batimentos': batimentos
    };
    int id = await db.insert('frequecia_cardiaca', frequencia,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  _get(int id) async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> frequencia = db.query(
        'frequecia_cardiaca',
        where: "id = ?",
        whereArgs: [id],
        limit: 1);
    return frequencia;
  }

  _getAll() async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> frequencia =
        db.query('frequecia_cardiaca', orderBy: 'id');
    return frequencia;
  }

  update(
      int id, int pacientId, DateTime? createAt, double batimentos) async {
    final db = await DataBaseService.instance.database;
    final frequencia = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'batimentos': batimentos
    };
    final result = db.update('frequecia_cardiaca', frequencia,
        where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  _delete(int id) async {
    final db = await DataBaseService.instance.database;
    try {
      db.delete('frequecia_cardiaca', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  _listAll() async {
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

  _getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return FrequenciaRespiratoria(
        id: dbResp[0]['id'],
        createAt: dbResp[0]['createAt'],
        idPaciente: dbResp[0]['idPaciente'],
        frequencia: dbResp[0]['frequencia']);
  }
}
