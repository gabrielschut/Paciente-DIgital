import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtils {

  static DbUtils _dbUtils;
//contrutor nomeado para criar instância de classe
  DbUtils._createInstance();

  factory DbUtils(){

    if(_dbUtils == null){
      //Executa apenas uma vez
      _dbUtils = DbUtils._createInstance();
    }
    return _dbUtils;
  }

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'PacienteDigital.db'),
        onCreate: (db, version) {
      db.execute('CREATE TABLE user (id INTEGER PRIMARY KEY AUTO_INCREMENT,login TEXT, passWord TEXT),');
      db.execute('CREATE TABLE pacientes(id INTEGER PRIMARY KEY AUTO_INCREMENT, nome TEXT, sexo TEXT,idade INTEGER,  FOREIGN KEY(idUser) REFERENCES user(id))');
      db.execute('CREATE TABLE medicamentos(id INTEGER PRIMARY KEY AUTO_INCREMENT, nome TEXT, dataInicio BLOB, dataFim BLOB, FOREIGN KEY(idPaciente) REFERENCES paciente(id}))');
      db.execute('CREATE TABLE pressao(id INTEGER PRIMARY KEY AUTO_INCREMENT, pMaxima REAL, pMinima REAL, date BLOB, FOREIGN KEY(idPaciente) REFERENCES paciente(id))');
      db.execute('CREATE TABLE peso(id INTEGER PRIMARY KEY AUTO_INCREMENT, peso REAL, date BLOB, FOREIGN KEY(idPaciente) REFERENCES paciente(id))');
      db.execute('CREATE TABLE glicemia(id INTEGER PRIMARY KEY AUTO_INCREMENT, glicemia REAL, date BLOB, FOREIGN KEY(idPaciente) REFERENCES paciente(id))');
      db.execute('CREATE TABLE circAbdominal (id INTEGER PRIMARY KEY AUTO_INCREMENT, circunferencia REAL, date BLOB, FOREIGN KEY(idPaciente) REFERENCES paciente(id)');
    });
  }

  Future close() async{
    sql.Database db;
    db.close();
  }
}
