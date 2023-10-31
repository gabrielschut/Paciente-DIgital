import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class ReclamacoesDatabaseHelper{

  static Future<int> create(int pacientId, DateTime? createAt, String text) async {
    final db = await DataBaseService.openDatabase();
    final reclamacao = {'paciente_id': pacientId,'createAt': createAt, 'reclamacao': text};
    int id = await db.insert('reclamacoes', reclamacao, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> reclamacao = db.query('reclamacoes', where: "id = ?", whereArgs: [id], limit: 1);
    db.close();
    return reclamacao;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> reclamacao = db.query('reclamacoes', orderBy: 'id');
    db.close();
    return reclamacao;
  }

  static Future<int> update(int id, int pacientId, DateTime? createAt, String text) async {
    final db = await DataBaseService.openDatabase();
    final reclamacao = {'paciente_id': pacientId,'createAt': createAt, 'reclamacao': text};
    final result = db.update('reclamacoes', reclamacao, where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseService.openDatabase();
    try{
      db.delete('reclamacoes', where: "id = ?", whereArgs: [id]);
    } catch (e){
      throw Exception("Falha ao deletar eliminação");
    }
    db.close();
  }
}