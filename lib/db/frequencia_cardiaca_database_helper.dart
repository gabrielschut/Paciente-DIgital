import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FrequenciaCardiacaDatabaseHelper{

  static Future<int> create(int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.openDatabase();
    final frequenciaCardiaca = {'paciente_id': pacientId,'createAt': createAt, 'frequencia': frequencia};
    int id = await db.insert('frequencia_respiratoria', frequenciaCardiaca, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> frequencia = db.query('frequencia_respiratoria', where: "id = ?", whereArgs: [id], limit: 1);
    db.close();
    return frequencia;
  }

  static Future<List<Map<String, dynamic>>> getAll() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> frequencia = db.query('frequencia_respiratoria', orderBy: 'id');
    db.close();
    return frequencia;
  }

  static Future<int> update(int id, int pacientId, DateTime? createAt, int frequencia) async {
    final db = await DataBaseService.openDatabase();
    final frequenciaCardiaca = {'paciente_id': pacientId,'createAt': createAt, 'frequencia': frequencia};
    final result = db.update('frequencia_respiratoria', frequenciaCardiaca, where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> delete(int id) async {
    final db = await DataBaseService.openDatabase();
    try{
      db.delete('frequencia_respiratoria', where: "id = ?", whereArgs: [id]);
    } catch (e){
      throw Exception("Falha ao deletar eliminação");
    }
    db.close();
  }
}