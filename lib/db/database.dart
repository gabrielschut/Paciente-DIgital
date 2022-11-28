import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper INSTANCE = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'pacienteDigital.db');
    return await openDatabase(path,
    version: 1,
    onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(_paciente);
    await db.execute(_medicamento);
    await db.execute(_eliminacoes);
    await db.execute(_frequenciaCardiaca);
    await db.execute(_frequenciaRespiratoria);
    await db.execute(_glicemia);
    await db.execute(_pressaoArterial);
    await db.execute(_reclamacoes);

  }

  String get _paciente => ''' 
    CREATE TABLE paciente (
    id INTEGER Primary Key AUTOINCREMENT,
    nome TEXT NOT NULL,
    sexo TEXT,
    idade INTEGER,
    tipoSanguineo TEXT,
    peso REAL,
    altura REAL,
    diabetis INTEGER,
    cardiaco INTEGER,
    circunferenciaAbdominal REAL,
    isActive INTEGER
    ); 
   ''';

  String get _medicamento => '''
  CREATE TABLE medicamento(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  nome TEXT NOT NULL,
  dosagem REAL,
  tarja TEXT,
  dataInicial INT NOT NULL,
  dataTermino INT NOT NULL
  );
  ''';

  String get _eliminacoes => '''
  CREATE TABLE eliminacoes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  excrecao TEXT,
  description TEXT
  );
  ''';

  String get _frequenciaCardiaca => '''
  CREATE TABLE frequecia_cardiaca(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  frequencia REAL NOT NULL
  )
  ''';

  String get _frequenciaRespiratoria => '''
  CREATE TABLE frequencia_respiratoria(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  frequencia INTEGER NOT NULL,
  );
  ''';

  String get _glicemia => '''
  CREATE TABLE glicemia(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  createA INT NOT NULL,
  value REAL NOT NULL,
  );
  ''';

  String get _pressaoArterial => '''
  CREATE TABLE pressao_arterial(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  maxima INTEGER NOT NULL,
  minima INTEGER NOT NULL,
  );
  ''';

  String get _reclamacoes => '''
  CREATE TABLE reclamacoes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  reclamacao TEXT NOT NULL
  );
  ''';
}