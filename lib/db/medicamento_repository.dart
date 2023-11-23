import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/medicamento.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class MedicamentoRepository extends ChangeNotifier{

  late Database db;

  MedicamentoRepository(){
    _initRepository();
  }

  _initRepository() async {
    await _listAll();
  }

  _create(int pacientId, String name, double dosagem, String? tarja, DateTime? dataIncio, int? diasDeUso) async {
    final db = await DataBaseService.instance.database;
    final medicamento = {
      'paciente_id': pacientId,
      'name': name,
      'dosagem': dosagem,
      'tarja': tarja,
      'data_inicial': dataIncio,
      'dias_de_uso': diasDeUso
    };
    int id = await db.insert('medicamento', medicamento, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return id;
  }

  _get(int id) async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> medicamento = db.query(
        'medicamento', where: "id = ?", whereArgs: [id], limit: 1);
    return medicamento;
  }

  _getAll() async {
    final db = await DataBaseService.instance.database;
    Future<List<Map<String, dynamic>>> medicamentos = db.query('medicamento');
    return medicamentos;
  }

  _update(int id, int pacientId, String name, double dosagem, String? tarja, DateTime? dataIncio, int? diasDeUso) async {
    final db = await DataBaseService.instance.database;
    final medicamento = {
      'paciente_id': pacientId,
      'name': name,
      'dosagem': dosagem,
      'tarja': tarja,
      'data_inicial': dataIncio,
      'dias_de_uso': diasDeUso
    };
    final result = db.update('medicamento', medicamento, where: "id = ?", whereArgs: [id]);
    notifyListeners();
    return result;
  }

  _delete(int id) async {
    final db = await DataBaseService.instance.database;
    try {
      db.delete('medicamento', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar medicamento");
    }
    notifyListeners();
  }

   _listAll() async {
    List<Map<String, dynamic>> dbResp = await _getAll();
    List<Medicamento> response = [];
    if (dbResp.isNotEmpty) {
      for (Map<String, dynamic> medicamento in dbResp) {
        response.add(Medicamento(id: medicamento['id'],
            idPaciente: medicamento['paciente_id'],
            nome: medicamento['nome'],
            dosagem: medicamento['dosagem'],
            tarja: medicamento['tarja'],
            dataInicial: medicamento['data_inicial'],
            diasDeUso: medicamento['dias_de_uso']));
      }
    }
    return response;
  }

  _getById(int id) async {
    List<Map<String, dynamic>> dbResp = await _get(id);
    return Medicamento(id: dbResp[0]['id'],
        idPaciente: dbResp[0]['paciente_id'],
        nome: dbResp[0]['nome'],
        dosagem: dbResp[0]['dosagem'],
        tarja: dbResp[0]['tarja'],
        dataInicial: dbResp[0]['data_inicial'],
        diasDeUso: dbResp[0]['dias_de_uso']);
  }

}