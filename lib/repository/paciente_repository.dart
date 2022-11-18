import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/dto/reponse/paciente_response.dart';
import 'package:sqflite/sqflite.dart';
import '../db/database.dart';
import '../model/paciente.dart';

class PacienteRepository extends ChangeNotifier {
  late Database db;

  Future<Paciente> _getByID(int id) async {
    db = await AppDatabase.instance.database;
    List paciente = await db.query('paciente', where: "paciente.id = {$id}");

    Paciente pacienteReturn = Paciente(
        id: paciente.first['id'],
        nome: paciente.first['nome'],
        sobrenome: paciente.first['sobrenome'],
        sexo: paciente.first['sexo'],
        idade: paciente.first['idade'],
        tipoSanguineo: paciente.first['tipo_saguineo'],
        peso: paciente.first['peso'],
        diabetis: paciente.first['diabetico'],
        cardiaco: paciente.first['cardiaco'],
        circunferenciaAbdominal: paciente.first['circ_abdominal']);
    notifyListeners();
    return pacienteReturn;
  }

  Future<List<PacienteResponse>> _getAll() async {
    List<PacienteResponse> allPacientes = [];
    List listPacientes = await db.query('paciente');

    listPacientes.forEach((element) {
      PacienteResponse response = PacienteResponse(
          id: element['id'],
          nome: element['nome'],
          sobrenome: element['sobrenome'],
          sexo: element['sexo'],
          idade: element['idade'],
          diabetes: element['diabetico'],
          cardicado: element['cardiaco']);

      allPacientes.add(response);
    });
    notifyListeners();
    return allPacientes;
  }

  void setPaciente(Paciente paciente) {
    int id = paciente.id!;
    db.update(
        'paciente',
        {
          'nome': paciente.nome,
          'sobrenome': paciente.sobrenome,
          'sexo': paciente.sexo,
          'idade': paciente.idade,
          'tipo_saguineo': paciente.tipoSanguineo,
          'peso': paciente.peso,
          'diabetico': paciente.diabetis,
          'cardiaco': paciente.cardiaco,
          'circ_abdominal': paciente.circunferenciaAbdominal,
          'is_active': paciente.isActive
        },
        where: "paciente.id = {$id}");
    notifyListeners();
  }

  void create(Paciente paciente) {
    db.insert('paciente', {
      'nome': paciente.nome,
      'sobrenome': paciente.sobrenome,
      'sexo': paciente.sexo,
      'idade': paciente.idade,
      'tipo_saguineo': paciente.tipoSanguineo,
      'peso': paciente.peso,
      'diabetico': paciente.diabetis,
      'cardiaco': paciente.cardiaco,
      'circ_abdominal': paciente.circunferenciaAbdominal,
    });
  }

  void deleteById(int id){
    db.delete('Paciente', where: "Paciente.id = {$id}");
    notifyListeners();
  }
}
