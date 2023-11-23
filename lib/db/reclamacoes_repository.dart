import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/reclamacoes.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class ReclamacoesRepository extends ChangeNotifier{

  late Database db;

  ReclamacoesRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _listAll();
  }

  _create(int pacientId, DateTime? createAt,
      String text) async {
    final db = await DataBaseService.instance.database;
    final reclamacao = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'reclamacao': text
    };
    int id = await db.insert('reclamacoes', reclamacao, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  _get(int id) async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> reclamacao =
    db.query('reclamacoes', where: "id = ?", whereArgs: [id], limit: 1);
    return reclamacao;
  }

  _getAll() async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> reclamacao =
    db.query('reclamacoes', orderBy: 'id');
    return reclamacao;
  }

  _update(int id, int pacientId, DateTime? createAt, String text) async {
    final db = await DataBaseService.instance.database;
    final reclamacao = {
      'paciente_id': pacientId,
      'createAt': createAt,
      'reclamacao': text
    };
    final result =
    db.update('reclamacoes', reclamacao, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  _delete(int id) async {
    final db = await DataBaseService.instance.database;
    try {
      db._delete('reclamacoes', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  _listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<Reclamacoes> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> reclamacao in dbResp) {
        response.add(Reclamacoes(
            id: reclamacao['id'],
            idPaciente: reclamacao['paciente_id'],
            createAt: reclamacao['createAt'],
            reclamacao: reclamacao['reclamacao']));
      }
    }
    return response;
  }

  _getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return Reclamacoes(id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        reclamacao: dbResp[0]['reclamacao']);
  }
}
