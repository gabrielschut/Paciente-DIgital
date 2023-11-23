import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {

  DataBaseService._();

  static final DataBaseService instance = DataBaseService._();

  static Database? _database;

  get database async {
    if(_database != null) return _database;
    _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(),"paciente_digital.db"),
        version: 1,
        onCreate: _createTables
    );
  }

  _createTables(database, version) async {
    await database.execute(_paciente);
    await database.execute(_medicamento);
    await database.execute(_eliminacoes);
    await database.execute(_frequeciaCardiaca);
    await database.execute(_frequenciaRespiratoria);
    await database.execute(_glicemia);
    await database.execute(_pressaoArterial);
    await database.execute(_reclamacoes);

  }

  String get _paciente => '''
     CREATE TABLE paciente (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nome TEXT NOT NULL,
    sexo TEXT,
    idade INTEGER,
    tipo_sanguineo TEXT,
    peso REAL,
    altura INTEGER,
    circunferencia_abdominal REAL
    ); 
  ''';

  String get _medicamento => '''
    CREATE TABLE medicamento(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    nome TEXT NOT NULL,
    dosagem REAL,
    tarja TEXT,
    data_inicial TIMESTAMP NOT NULL,
    dias_de_uso INT NOT NULL
    );
  ''';

  String get _eliminacoes => '''
    CREATE TABLE eliminacoes(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULL,
    excrecao TEXT,
    description TEXT
    );
  ''';

  String get _frequeciaCardiaca => '''
    CREATE TABLE frequecia_cardiaca(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULLL,
    batimentos REAL NOT NULL
    );  
  ''';

  String get _frequenciaRespiratoria => '''
    CREATE TABLE frequencia_respiratoria(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULL,
    frequencia INTEGER NOT NULL
    );  
  ''';

  String get _glicemia => '''
    CREATE TABLE glicemia(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULL,
    value REAL NOT NULL
    ); 
  ''';

  String get _pressaoArterial => '''
    CREATE TABLE pressao_arterial(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULL,
    maxima INTEGER NOT NULL,
    minima INTEGER NOT NULL
    );  
  ''';

  String get _reclamacoes => '''    
    CREATE TABLE reclamacoes(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULL,
    reclamacao TEXT NOT NULL
    );  
    ''';
}
