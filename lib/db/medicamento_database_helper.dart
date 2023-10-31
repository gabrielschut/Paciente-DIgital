import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class MedicamentoDatabaseHelper{

  static Future<List<Map<String, dynamic>>> getMedicamento(int id) async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> medicamento = db.query('medicamento', where: "id = ?", whereArgs: [id], limit: 1);
    db.close();
    return medicamento;
  }

  static Future<List<Map<String, dynamic>>> getAllMedicamentos() async {
    final db = await DataBaseService.openDatabase();
    Future<List<Map<String,dynamic>>> medicamentos = db.query('medicamento', orderBy: 'id');
    db.close();
    return medicamentos;
  }

  static Future<int> updateMedicamento(int id, int pacientId,String name, double dosagem, String? tarja, DateTime? dataIncio, int? diasDeUso) async {
    final db = await DataBaseService.openDatabase();
    final medicamento = {
      'paciente_id': pacientId,'name' : name, 'dosagem': dosagem, 'tarja' : tarja, 'data_inicial': dataIncio,
      'dias_de_uso': diasDeUso
    };
    final result = db.update('medicamento', medicamento, where: "id = ?", whereArgs: [id]);
    db.close();
    return result;
  }

  static Future<void> deleteMediacamento(int id) async {
    final db = await DataBaseService.openDatabase();
    try{
      db.delete('medicamento', where: "id = ?", whereArgs: [id]);
    } catch (e){
      throw Exception("Falha ao deletar medicamento");
    }
    db.close();
  }

}