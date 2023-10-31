import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class PacienteDatabaseHelper{

  static Future<int> create(String name, String sexo, int idade, String? tipoSanguineo, double? peso,
      int? altura, double? circAbdominal) async {
    final db = await DataBaseService.openDatabase();
    final paciente = {
      'name' : name, 'sexo': sexo, 'idade' : idade, 'tipo_sanguineo': tipoSanguineo,
      'peso': peso, 'altura': altura, 'circunferencia_abdominal': circAbdominal
    };
    int id = await db.insert('paciente', paciente, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    db.close();
    return id;
  }

  static Future<List<Map<String, dynamic>>> get(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> paciente = db.query('paciente', where: "id = ?", whereArgs: [id], limit: 1);
    db.close();
    return paciente;
  }

  static Future<int> update(int id, String name, String sexo, int idade, String? tipoSanguineo, double? peso,
      int? altura, double? circAbdominal) async {
    final db = await DataBaseService.openDatabase();
    final paciente = {
      'name' : name, 'sexo': sexo, 'idade' : idade, 'tipo_sanguineo': tipoSanguineo,
      'peso': peso, 'altura': altura, 'circunferencia_abdominal': circAbdominal
    };
    final result = db.update('pacinete', paciente, where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

}