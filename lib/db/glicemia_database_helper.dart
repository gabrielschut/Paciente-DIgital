import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class GlicemiaDatabaseHelper{

  static Future<int> create(int pacientId, DateTime? createAt, int value) async {
    final db = await DataBaseService.openDatabase();
    final glicemia = {'paciente_id': pacientId,'createAt': createAt, 'value': value};
    int id = await db.insert('glicemia', glicemia, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> glicemia = db.query('glicemia', where: "id = ?", whereArgs: [id], limit: 1);
    db.close();
    return glicemia;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> glicemia = db.query('glicemia', orderBy: 'id');
    db.close();
    return glicemia;
  }

  static Future<int> update(int id, int pacientId, DateTime? createAt, int value) async {
    final db = await DataBaseService.openDatabase();
    final glicemia = {'paciente_id': pacientId,'createAt': createAt, 'value': value};
    final result = db.update('glicemia', glicemia, where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseService.openDatabase();
    try{
      db.delete('glicemia', where: "id = ?", whereArgs: [id]);
    } catch (e){
      throw Exception("Falha ao deletar eliminação");
    }
    db.close();
  }
}