import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/paciente.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class PacienteRepository extends ChangeNotifier{

  Future<int> create(String name, String sexo, int idade, String? tipoSanguineo, double? peso, int? altura,
      double? circAbdominal) async {
    final db = await DataBaseService.database();
    final paciente = {
      'nome': name,
      'sexo': sexo,
      'idade': idade,
      'tipo_sanguineo': tipoSanguineo,
      'peso': peso,
      'altura': altura,
      'circunferencia_abdominal': circAbdominal
    };
    int id = await db.insert('paciente', paciente, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> paciente = db.query(
        'paciente', where: "id = ?", whereArgs: [id], limit: 1);
    return paciente;
  }

  Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> pacientes = db.query(
        'paciente', orderBy: 'id');
    return pacientes;
  }

  Future<int> update(int id, String name, String sexo, int idade, String? tipoSanguineo, double? peso,
      int? altura, double? circAbdominal) async {
    final db = await DataBaseService.database();
    final paciente = {
      'nome': name,
      'sexo': sexo,
      'idade': idade,
      'tipo_sanguineo': tipoSanguineo,
      'peso': peso,
      'altura': altura,
      'circunferencia_abdominal': circAbdominal
    };
    final result = db.update('pacinete', paciente, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  Future<Paciente> getPaciente() async {
    List<Map<String,dynamic>> dbResp = await _getAll();
    if(dbResp.isNotEmpty){
      return Paciente(id: dbResp[0]['id'], nome: dbResp[0]['nome'], sexo: dbResp[0]['sexo'], idade: dbResp[0]['idade'],
          circunferenciaAbdominal: dbResp[0]['circunferencia_abdominal'],
          tipoSanguineo: dbResp[0]['tipo_sanguineo'], peso: dbResp[0]['peso'], altura: dbResp[0]['altura']);
    }
    return Paciente(id: 0, nome: '', sexo: '', idade: 0);
  }
}