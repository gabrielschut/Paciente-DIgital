import 'package:sqflite/sqflite.dart' as sql;

class DataBaseService {

  static Future<void> createTables(sql.Database database)async {
    await database.execute('''
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
    
    CREATE TABLE medicamento(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    nome TEXT NOT NULL,
    dosagem REAL,
    tarja TEXT,
    data_inicial TIMESTAMP NOT NULL,
    dias_de_uso INT NOT NULL
    );
    
    CREATE TABLE eliminacoes(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    paciente_id INTEGER,
    createAt TIMESTAMP NOT NULL,
    excrecao TEXT,
    description TEXT
    );
    
    CREATE TABLE frequecia_cardiaca(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    idPaciente INTEGER,
    createAt TIMESTAMP NOT NULLL,
    batimentos REAL NOT NULL
    );      
    
    CREATE TABLE frequencia_respiratoria(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    idPaciente INTEGER,
    createAt TIMESTAMP NOT NULL,
    frequencia INTEGER NOT NULL
    );  
    
    CREATE TABLE glicemia(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    idPaciente INTEGER,
    createA TIMESTAMP NOT NULL,
    value REAL NOT NULL
    );  
    
    CREATE TABLE pressao_arterial(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    idPaciente INTEGER,
    createAt TIMESTAMP NOT NULL,
    maxima INTEGER NOT NULL,
    minima INTEGER NOT NULL
    );  
    
    CREATE TABLE reclamacoes(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    idPaciente INTEGER,
    createAt TIMESTAMP NOT NULL,
    reclamacao TEXT NOT NULL
    );  
    ''');
  }

  static Future<sql.Database> openDatabase() async {
    return sql.openDatabase("paciente_digital.db", version: 1, onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }
}
