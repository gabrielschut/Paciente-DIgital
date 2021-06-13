import 'package:paciente_digital/models/pacientes.dart';
import 'package:paciente_digital/models/user.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'dart:io';

class DbUtils {
//Cria conecxão
  static DbUtils _dbHelper;
  static sql.Database _database;

  DbUtils._createInstance();

  factory DbUtils() {
    if (_dbHelper == null) {
      _dbHelper = DbUtils._createInstance();
    }
    return _dbHelper;
  }

  //nomes parametros gerias
  static String ID = 'id';
  static String IDPACIENTE = 'idPaciente';
  static String NOME = 'nome';
  static String DATE = 'date';

  //Especificas
  static String IDUSER = 'idUser';
  static String LOGIN = 'login';
  static String PASSWORD = 'passWord';
  static String SEXO = 'sexo';
  static String IDADE = 'idade';
  static String DATAINIT = 'dataInicio';
  static String DATAFIM = 'dataFim';
  static String PRESSAOMAX = 'pMaxima';
  static String PRESSAOMIN = 'pMinima';
  static String PESO = 'peso';
  static String GLICEMIA = 'glicemia';
  static String CIRCUNFERENCIA = 'circunferencia';

  Future<sql.Database> get database async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database;
  }

  //Cria as tabelas
  void _creatDB(sql.Database db, int version) async {
    await db.execute(
        'CREATE TABLE user ($ID INTEGER PRIMARY KEY AUTO_INCREMENT,$LOGIN TEXT, $PASSWORD TEXT)');
    await db.execute(
        'CREATE TABLE pacientes($ID INTEGER PRIMARY KEY AUTO_INCREMENT, $NOME TEXT, $SEXO TEXT, $IDADE INTEGER,  FOREIGN KEY($IDUSER) REFERENCES user($ID))');
    await db.execute(
        'CREATE TABLE medicamentos($ID INTEGER PRIMARY KEY AUTO_INCREMENT, $NOME TEXT, $DATAINIT BLOB, $DATAFIM BLOB, FOREIGN KEY($IDPACIENTE) REFERENCES paciente($ID))');
    await db.execute(
        'CREATE TABLE pressao($ID INTEGER PRIMARY KEY AUTO_INCREMENT, $PRESSAOMAX REAL, $PRESSAOMIN REAL, $DATE BLOB, FOREIGN KEY($IDPACIENTE) REFERENCES paciente($ID))');
    await db.execute(
        'CREATE TABLE peso($ID INTEGER PRIMARY KEY AUTO_INCREMENT, $PESO REAL, $DATE BLOB, FOREIGN KEY($IDPACIENTE) REFERENCES paciente($ID))');
    await db.execute(
        'CREATE TABLE glicemia($ID INTEGER PRIMARY KEY AUTO_INCREMENT, $GLICEMIA REAL, $DATE BLOB, FOREIGN KEY($IDPACIENTE) REFERENCES paciente($ID))');
    await db.execute(
        'CREATE TABLE circAbdominal($ID INTEGER PRIMARY KEY AUTO_INCREMENT, $CIRCUNFERENCIA REAL, $DATE BLOB, FOREIGN KEY($IDPACIENTE) REFERENCES paciente($ID)');
  }

  Future<sql.Database> initDatabase() async {
    //  Pega o caminho para salvar o DB;
    Directory directory = await pathprovider.getApplicationDocumentsDirectory();
    String caminho = directory.path + 'PacienteDigital.db';

    var bancoDeDados =
        await sql.openDatabase(caminho, version: 1, onCreate: _creatDB);
    return bancoDeDados;
  }

  Future close() async {
    sql.Database db;
    db.close();
  }

  //Metodos para usuário
  //Metodo de cadastro Usuário
  Future<int> inserirUsuario(User user) async {
    sql.Database db = await this.database;
    int resultado = await db.insert('user', user.toMap());
    return resultado;
  }

  //exemplo listar
  listarPaciente() async {
    sql.Database db = await this.database;
    String SQL = "SLECT * FROM pacientes";
    List lista = await db.rawQuery(SQL);
    return lista;
  }

// Exemplo excluir
  Future<int> excluirPaciente(int iD) async {
    sql.Database db = await this.database;

    var resultado = await db.delete(
      'pacientes',
      where: "id =?",
      whereArgs: [iD],
    );
    return resultado;
  }

//  Exemplo alterar

  Future<int> alterarPaciente(Paciente paciente) async {
    sql.Database db = await this.database;
    return await db.update(
      'pacientes',
      paciente.toMap(),
      where: "id = ?",
      whereArgs: [paciente.id],
    );
  }
}
