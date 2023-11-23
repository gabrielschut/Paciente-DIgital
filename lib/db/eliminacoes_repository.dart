import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:sqflite/sqlite_api.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;
class EliminacoesRepository extends ChangeNotifier{

  late Database db;

  EliminacoesRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _listAll();
  }

  _create(int pacientId, String excrecao, String? descricao, DateTime? createAt) async {
    final db = await DataBaseService.instance.database;
    final eliminacao = {
      'paciente_id': pacientId,
      'excrecao': excrecao,
      'description': descricao,
      'createAt': createAt
    };
    int id = await db.insert('eliminacao', eliminacao,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  _get(int id) async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> eliminacao =
        db.query('eliminacao', where: "id = ?", whereArgs: [id], limit: 1);
    return eliminacao;
  }

  _getAll() async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> eliminacao =
        db.query('eliminacao', orderBy: 'id');
    return eliminacao;
  }

  _update(int id, int pacientId, String excrecao, String? descricao, DateTime? createAt) async {
    final db = await DataBaseService.instance.database;    final eliminacao = {
      'paciente_id': pacientId,
      'excrecao': excrecao,
      'description': descricao,
      'createAt': createAt
    };
    final result = db.update('eliminacao', eliminacao, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  _delete(int id) async {
    final db = await DataBaseService.instance.database;    try {
      db.delete('eliminacao', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  _listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<Eliminacoes> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> eliminacaoMap in dbResp) {
        response.add(Eliminacoes(
            id: eliminacaoMap['id'],
            idPaciente: eliminacaoMap['paciente_id'],
            createAt: eliminacaoMap['createAt'],
            excrecao: eliminacaoMap['excrecao'],
            description: eliminacaoMap['description']));
      }
    }
    notifyListeners();
    return response;
  }

  Future<Eliminacoes> getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return Eliminacoes(
        id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        createAt: dbResp[0]['createAt'],
        excrecao: dbResp[0]['excrecao'],
        description: dbResp[0]['description']);
  }
}