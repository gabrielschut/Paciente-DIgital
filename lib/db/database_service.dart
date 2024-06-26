import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPath, "database"), version: 1,
        onCreate: (db, version) {
      db.execute('''
         CREATE TABLE IF NOT EXISTS paciente (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          nome TEXT NOT NULL,
          sexo TEXT,
          idade INTEGER,
          tipo_sanguineo TEXT,
          peso REAL,
          altura INTEGER,
          circunferencia_abdominal REAL)''');
      db.execute('''
        CREATE TABLE IF NOT EXISTS medicamento (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          nome TEXT NOT NULL,
          dosagem REAL,
          tarja TEXT,
          data_inicial INTEGER NOT NULL,
          dias_de_uso INTEGER NOT NULL)''');
      db.execute('''
        CREATE TABLE IF NOT EXISTS eliminacoes(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          createAt INTEGER NOT NULL,
          excrecao TEXT,
          description TEXT)''');
      db.execute('''
        CREATE TABLE IF NOT EXISTS frequencia_cardiaca(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          createAt INTEGER NOT NULL,
          batimentos REAL)''');
      db.execute('''
        CREATE TABLE IF NOT EXISTS frequencia_respiratoria(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          createAt INTEGER NOT NULL,
          frequencia REAL)''');
      db.execute('''
        CREATE TABLE IF NOT EXISTS glicemia(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          createAt INTEGER NOT NULL,
          value REAL)''');
      db.execute('''
        CREATE TABLE IF NOT EXISTS pressao_arterial(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          createAt INTEGER NOT NULL,
          maxima INTEGER NOT NULL,
          minima INTEGER NOT NULL)''');
      db.execute('''    
        CREATE TABLE IF NOT EXISTS reclamacoes(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          paciente_id INTEGER,
          createAt INTEGER NOT NULL,
          reclamacao TEXT NOT NULL)''');
    });
  }

  static Future<List<Map<String, dynamic>>> findAll(String table) async {
    final db = await DataBaseService.database();
    return db.query(table);
    //return db.rawQuery("SELECT * from $table");
  }
}
