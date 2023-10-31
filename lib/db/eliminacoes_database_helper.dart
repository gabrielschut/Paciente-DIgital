import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class EliminacoesDatabaseHelper{

  static Future<int> create(int pacientId,String excrecao, String? descricao, DateTime? createAt) async {
    final db = await DataBaseService.openDatabase();
    final eliminacao = {'paciente_id': pacientId,'excrecao' : excrecao, 'description' : descricao, 'createAt': createAt};
    int id = await db.insert('eliminacao', eliminacao, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> eliminacao = db.query('eliminacao', where: "id = ?", whereArgs: [id], limit: 1);
    db.close();
    return eliminacao;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> eliminacao = db.query('eliminacao', orderBy: 'id');
    db.close();
    return eliminacao;
  }

  static Future<int> update(int id, int pacientId,String excrecao, String? descricao, DateTime? createAt) async {
    final db = await DataBaseService.openDatabase();
    final eliminacao = {'paciente_id': pacientId,'excrecao' : excrecao, 'description' : descricao, 'createAt': createAt};
    final result = db.update('eliminacao', eliminacao, where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseService.openDatabase();
    try{
      db.delete('eliminacao', where: "id = ?", whereArgs: [id]);
    } catch (e){
      throw Exception("Falha ao deletar eliminação");
    }
    db.close();
  }

}