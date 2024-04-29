import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class EliminacoesRepository extends ChangeNotifier{

  Future<int> create(int pacientId, String excrecao, String? descricao, int createAt) async {
    final db = await DataBaseService.database();
    final eliminacao = {
      'paciente_id': pacientId,
      'excrecao': excrecao,
      'description': descricao,
      'createAt': createAt
    };
    int id = await db.insert('eliminacoes', eliminacao,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> eliminacao =
        db.query('eliminacoes', where: "id = ?", whereArgs: [id], limit: 1);
    return eliminacao;
  }

  Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> eliminacao =
        db.query('eliminacoes', orderBy: 'id');
    return eliminacao;
  }

  Future<int> update(int id, int pacientId, String excrecao, String? descricao, DateTime? createAt) async {
    final db = await DataBaseService.database();
    final eliminacao = {
      'paciente_id': pacientId,
      'excrecao': excrecao,
      'description': descricao,
      'createAt': createAt
    };
    final result = db.update('eliminacoes', eliminacao, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  Future<void> delete(int id) async {
    final db = await DataBaseService.database();
    try {
      db.delete('eliminacoes', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar eliminação");
    }
    notifyListeners();
  }

  Future<List<Eliminacoes>> listAll() async {
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
