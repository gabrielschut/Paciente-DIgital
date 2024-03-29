import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();

  static Database? _database;

  AppDatabase._init();

  get database async {
    if (_database != null) return _database;

    return await _initDB('pacienteDigital.db');
  }

  _initDB(String filePath) async {
    return await openDatabase(
      join(await getDatabasesPath(), 'pacienteDigital.db'),
      version: 1,
      onCreate: _createDB,
    );
  }

  _createDB(Database db, int version) async {
    await db.execute(_paciente);
    await db.execute(_medicamento);
    await db.execute(_eliminacoes);
    await db.execute(_frequenciaCardiaca);
    await db.execute(_frequenciaRespiratoria);
    await db.execute(_glicemia);
    await db.execute(_pressaoArterial);
    await db.execute(_reclamacoes);

  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  String get _paciente => ''' 
    CREATE TABLE paciente (
    id INTEGER Primary Key AUTOINCREMENT,
    nome TEXT NOT NULL,
    sobrenome TEXT NOT NUL,
    sexo TEXT,
    idade INTEGER,
    tipo_saguineo TEXT,
    peso REAL,
    diabetico INTEGER,
    cardiaco INTEGER,
    circ_abdominal REAL,
    is_active INTEGER
    ); 
   ''';

  String get _medicamento => '''
  CREATE TABLE medicamento(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  nome TEXT NOT NULL,
  dosagem REAL,
  data_inicio INT NOT NULL,
  data_termino INT NOT NULL
  );
  ''';

  String get _eliminacoes => '''
  CREATE TABLE eliminacoes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  create_at INT NOT NULL,
  excrecao TEXT,
  descricao TEXT
  );
  ''';

  String get _frequenciaCardiaca => '''
  CREATE TABLE frequecia_cardiaca(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  create_at INT NOT NULL,
  frequencia REAL NOT NULL
  )
  ''';

  String get _frequenciaRespiratoria => '''
  CREATE TABLE frequencia_respiratoria(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  create_at INT NOT NULL,
  frequencia INTEGER NOT NULL,
  );
  ''';

  String get _glicemia => '''
  CREATE TABLE glicemia(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  create_at INT NOT NULL,
  value REAL NOT NULL,
  );
  ''';

  String get _pressaoArterial => '''
  CREATE TABLE pressao_arterial(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  create_at INT NOT NULL,
  maxima INTEGER NOT NULL,
  minima INTEGER NOT NULL,
  );
  ''';

  String get _reclamacoes => '''
  CREATE TABLE reclamacoes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  id_paciente INTEGER FOREIGN KEY,
  create_at INT NOT NULL,
  reclamacao TEXT NOT NULL
  );
  ''';
}
