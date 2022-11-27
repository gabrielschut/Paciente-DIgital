import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../db/database.dart';
import '../model/paciente.dart';

class PacienteRepository extends ChangeNotifier {

  PacienteRepository._privateConstructor();
  static final PacienteRepository INSTANCE = PacienteRepository._privateConstructor();

  late Database db;

  Future<List<Paciente>> getByID(int id) async {
    db = await DatabaseHelper.INSTANCE.database;
    List paciente = await db.query('paciente', where: "paciente.id = {$id}");

    List<Paciente> pacienteReturn = [];
    if (paciente.isNotEmpty) {
      pacienteReturn.add(Paciente(
          id: paciente.first['id'],
          nome: paciente.first['nome'],
          sexo: paciente.first['sexo'],
          idade: paciente.first['idade'],
          tipoSanguineo: paciente.first['tipo_saguineo'],
          peso: paciente.first['peso'],
          altura: paciente.first['altura'],
          diabetis: paciente.first['diabetico'],
          cardiaco: paciente.first['cardiaco'],
          circunferenciaAbdominal: paciente.first['circ_abdominal']));
    }

    notifyListeners();
    return pacienteReturn;
  }

  Future<List<Paciente>> getAll() async {
    db = await DatabaseHelper.INSTANCE.database;
    List<Paciente> allPacientes = [];
    List listPacientes = await db.query('paciente');

    if (listPacientes.isNotEmpty) {
      listPacientes.forEach(
        (element) {
          Paciente newPaciente = Paciente(
            id: element['id'],
            nome: element['nome'],
            sexo: element['sexo'],
            idade: element['idade'],
            tipoSanguineo: element['tipo_saguineo'],
            altura: element['altura'],
            peso: element['peso'],
            diabetis: element['diabetico'],
            cardiaco: element['cardiaco'],
            circunferenciaAbdominal: element['circ_abdominal'],
            isActive: element['is_active'],
          );
          allPacientes.add(newPaciente);
        },
      );
    }

    notifyListeners();
    return allPacientes;
  }

  void setPaciente(Paciente paciente) async {
    db = await DatabaseHelper.INSTANCE.database;
    int id = paciente.id!;
    db.update(
        'paciente',
        {
          'nome': paciente.nome,
          'sexo': paciente.sexo,
          'idade': paciente.idade,
          'tipo_saguineo': paciente.tipoSanguineo,
          'peso': paciente.peso,
          'altura': paciente.altura,
          'diabetico': paciente.diabetis,
          'cardiaco': paciente.cardiaco,
          'circ_abdominal': paciente.circunferenciaAbdominal,
          'is_active': paciente.isActive
        },
        where: "paciente.id = {$id}");
    notifyListeners();
  }

  void create(Paciente paciente) async {
    db = await DatabaseHelper.INSTANCE.database;
    db.insert('paciente', {
      'nome': paciente.nome,
      'sexo': paciente.sexo,
      'idade': paciente.idade,
      'tipo_saguineo': paciente.tipoSanguineo,
      'peso': paciente.peso,
      'altura': paciente.altura,
      'diabetico': paciente.diabetis,
      'cardiaco': paciente.cardiaco,
      'circ_abdominal': paciente.circunferenciaAbdominal,
      'is_active' : true,
    });
  }

  void deleteById(int id) async {
    db = await DatabaseHelper.INSTANCE.database;
    db.delete('Paciente', where: "Paciente.id = {$id}");
    notifyListeners();
  }
}
