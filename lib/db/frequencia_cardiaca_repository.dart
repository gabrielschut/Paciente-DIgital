import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/frequencia_cardiaca.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FrequenciaCardiacaRepository extends ChangeNotifier{

  late Database db;

  FrequenciaCardiacaRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _listAll();
  }

  _create(
      int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.instance.database;
    final frequenciaCardiaca = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'frequencia': frequencia
    };
    int id = await db.insert('frequencia_respiratoria', frequenciaCardiaca,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  _get(int id) async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> frequencia = db.query(
        'frequencia_respiratoria',
        where: "id = ?",
        whereArgs: [id],
        limit: 1);
    return frequencia;
  }

  _getAll() async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> frequencia =
        db.query('frequencia_respiratoria', orderBy: 'id');
    return frequencia;
  }

  _update(
      int id, int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.instance.database;
    final frequenciaCardiaca = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'frequencia': frequencia
    };
    final result = db.update('frequencia_respiratoria', frequenciaCardiaca,
        where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  _delete(int id) async {
    final db = await DataBaseService.instance.database;
    try {
      db._delete('frequencia_respiratoria', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

   _listAll() async {
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

  _getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return FrenquenciaCardiaca(
        id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        frequencia: dbResp[0]['frequencia']);
  }
}
