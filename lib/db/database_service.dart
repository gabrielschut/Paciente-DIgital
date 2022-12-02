import 'package:get/get.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:paciente_digital/model/paciente.dart';
import 'package:paciente_digital/model/tab_paciente_entitie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService extends GetxService {
  late Database db;

  Future<DataBaseService> init() async {
    db = await getDatabase();
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
    List<Paciente> pacientes = [];
    pacientes.addAll(result.map((json) => Paciente.fromJson(json)));
    return pacientes;
  }

  Future<Paciente> getPacientes(int id) async {
    final result = await db.rawQuery("SELECT * from paciente ORDER BY id");
    List<Paciente> pacientes = [];
    pacientes.addAll(result.map((json) => Paciente.fromJson(json)));
    Paciente paciente = Paciente(nome: "unkow", sexo: "", idade: 0);
    pacientes.forEach((element) {
      if(element.id == id){
        paciente = element;
      }
    });
    return paciente;
  }

  Future<Paciente> savePaciente(Paciente paciente) async {
    final id = await db.rawInsert(
        'INSERT INTO paciente (nome, idade, sexo, altura, peso, tipoSanguineo, circunferenciaAbdominal)'
        ' VALUES (?, ?, ?, ?,?, ?, ?)',
        [
          paciente.nome,
          paciente.idade,
          paciente.sexo,
          paciente.altura,
          paciente.peso,
          paciente.tipoSanguineo,
          paciente.circunferenciaAbdominal,
        ]);

    return paciente.copy(id: id);
  }

  Future<Paciente> updatePaciente(Paciente paciente) async {
    final id = await db.rawUpdate(
        "UPDATE paciente SET nome = ?, idade = ?,sexo = ?, "
        "altura = ?, peso = ?, tipoSanguineo = ?,"
        " circunferenciaAbdominal =? WHERE id = ?",
        [
          paciente.nome,
          paciente.idade,
          paciente.sexo,
          paciente.altura,
          paciente.peso,
          paciente.tipoSanguineo,
          paciente.circunferenciaAbdominal,
          paciente.id
        ]);

    return paciente.copy(id: id);
  }

  Future<int> deletePaciente(int pacienteId) async {
    final id =
        await db.rawDelete("DELETE FROM paciente WHERE id  = ?", [pacienteId]);
    return id;
  }

  Future close() async {
    db.close();
  }

  Future<List<Medicamento>> getAllMedicamento(int idPaciente) async {
    final result = await db.rawQuery("SELECT * from medicamento WHERE idPaciente = ?  ORDER BY id");
    List<Medicamento> medicamentos = [];
    medicamentos.addAll(result.map((json) => Medicamento.fromJson(json)));
    return medicamentos;
  }

  Future<Medicamento> saveMedicamento(Medicamento medicamento) async {
    final id = await db.rawInsert(
        'INSERT INTO medicamento (nome, idPaciente, dataTermino, dataInicial, dosagem, tarja)'
        ' VALUES (?, ?, ?, ?,?, ?)',
        [
          medicamento.nome,
          medicamento.idPaciente,
          medicamento.dataTermino,
          medicamento.dataInicial,
          medicamento.dosagem,
          medicamento.tarja,
        ]);

    return medicamento.copy(id: id);
  }

  Future<int> deleteMedicamento(int medicamentoId) async {
    final id = await db
        .rawDelete("DELETE FROM medicamento WHERE id  = ?", [medicamentoId]);
    return id;
  }

  Future<TabPacienteEntitie> generateTabPaciente(int id) async {
    Paciente paciente = getPacientes(id) as Paciente;
    List<Medicamento> medicamentos = [];
    medicamentos = getAllMedicamento(id) as List<Medicamento>;
    TabPacienteEntitie tabPacienteEntitie = TabPacienteEntitie(paciente: paciente, medicamentos: medicamentos);
    return tabPacienteEntitie;
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
    circunferenciaAbdominal REAL
    ); 
   ''';

  String get _medicamento => '''
  CREATE TABLE medicamento(
  id INTEGER PRIMARY KEY,
  idPaciente INTEGER,
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
  idPaciente INTEGER,
  createAt INT NOT NULL,
  excrecao TEXT,
  description TEXT
  );
  ''';

  String get _frequenciaCardiaca => '''
  CREATE TABLE frequecia_cardiaca(
  id INTEGER PRIMARY KEY,
  idPaciente INTEGER,
  createAt INT NOT NULL,
  frequencia REAL NOT NULL
  );
  ''';

  String get _frequenciaRespiratoria => '''
  CREATE TABLE frequencia_respiratoria(
  id INTEGER PRIMARY KEY,
  idPaciente INTEGER,
  createAt INT NOT NULL,
  frequencia INTEGER NOT NULL
  );
  ''';

  String get _glicemia => '''
  CREATE TABLE glicemia(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER,
  createA INT NOT NULL,
  value REAL NOT NULL
  );
  ''';

  String get _pressaoArterial => '''
  CREATE TABLE pressao_arterial(
  id INTEGER PRIMARY KEY,
  idPaciente INTEGER,
  createAt INT NOT NULL,
  maxima INTEGER NOT NULL,
  minima INTEGER NOT NULL
  );
  ''';

  String get _reclamacoes => '''
  CREATE TABLE reclamacoes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPaciente INTEGER,
  createAt INT NOT NULL,
  reclamacao TEXT NOT NULL
  );
  ''';
}
