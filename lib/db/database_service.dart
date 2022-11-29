import 'package:get/get.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService extends GetxService {
  late Database db;

  Future<DataBaseService> init() async {
    // final paciente = Paciente(
    //   nome: "Gabriel Schutt",
    //   sexo: "Masculino",
    //   idade: 26,
    //   diabetis: false,
    //   cardiaco: false,
    //   isActive: true,
    //   peso: 60,
    //   altura: 1.83,
    //   tipoSanguineo: "O+",
    //   circunferenciaAbdominal: 76.3,
    // );
    // await savePaciente(paciente);
    return this;
  }

  Future<Database> getDatabase() async {
    var databasePath = await getDatabasesPath();
    return db = await openDatabase(
      join(databasePath, 'pacienteDigital.db'),
      onCreate: (db, version) {
        db.execute(_paciente);
        db.execute(_medicamento);
        db.execute(_eliminacoes);
        db.execute(_frequenciaCardiaca);
        db.execute(_frequenciaRespiratoria);
        db.execute(_glicemia);
        db.execute(_pressaoArterial);
        return db.execute(_reclamacoes);
      },
      version: 1,
    );
  }

  Future<List<Paciente>> getAllPacientes() async {
    final result = await db.rawQuery("SELECT * from paciente ORDER BY id");
    return result.map((json) => Paciente.fromJson(json)).toList();
  }

  Future<Paciente> savePaciente(Paciente paciente) async {
    final id = await db.rawInsert(
        'INSERT INTO paciente (nome, idade, sexo, altura, peso, tipoSanguineo,'
        ' diabetis, cardiaco, circunferenciaAbdominal, isActive',
        [
          paciente.nome,
          paciente.idade,
          paciente.sexo,
          paciente.altura,
          paciente.peso,
          paciente.tipoSanguineo,
          paciente.diabetis,
          paciente.cardiaco,
          paciente.circunferenciaAbdominal,
          paciente.isActive,
        ]);

    return paciente.copy(
      id: id,
    );
  }

  Future<Paciente> updatePaciente(Paciente paciente) async {
    final id = await db.rawUpdate(
        "UPDATE paciente SET nome = ?, idade = ?,sexo = ?, "
        "altura = ?, peso = ?, tipoSanguineo = ?, diabetis = ?, cardiaco = ?,"
        " circunferenciaAbdominal =?, isActive =? ",
        [
          paciente.nome,
          paciente.idade,
          paciente.sexo,
          paciente.altura,
          paciente.peso,
          paciente.tipoSanguineo,
          paciente.diabetis,
          paciente.cardiaco,
          paciente.circunferenciaAbdominal,
          paciente.isActive,
          paciente.id
        ]);

    paciente.copy(
      id: id,
    );
    return paciente;
  }

  Future<int> deletePaciente(int pacienteId) async {
    final id =
        await db.rawDelete("DELETE FROM paciente WHERE id  = ?", [pacienteId]);
    return id;
  }

  Future close() async {
    db.close();
  }

  String get _paciente => ''' 
    CREATE TABLE paciente (
    id INTEGER Primary Key,
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
  id INTEGER PRIMARY KEY,
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
  id INTEGER PRIMARY KEY ,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  excrecao TEXT,
  description TEXT
  );
  ''';

  String get _frequenciaCardiaca => '''
  CREATE TABLE frequecia_cardiaca(
  id INTEGER PRIMARY KEY,
  idPaciente INTEGER FOREIGN KEY,
  createAt INT NOT NULL,
  frequencia REAL NOT NULL
  )
  ''';

  String get _frequenciaRespiratoria => '''
  CREATE TABLE frequencia_respiratoria(
  id INTEGER PRIMARY KEY,
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
  id INTEGER PRIMARY KEY,
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
