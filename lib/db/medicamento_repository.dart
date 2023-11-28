import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/medicamento.dart';

import 'database_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class MedicamentoRepository extends ChangeNotifier{

  Future<Medicamento> create(int pacientId, String name, double dosagem, String? tarja, int dataIncio, int? diasDeUso) async {
    final db = await DataBaseService.database();
    final medicamento = {
      'paciente_id': pacientId,
      'nome': name,
      'dosagem': dosagem,
      'tarja': tarja,
      'data_inicial': dataIncio,
      'dias_de_uso': diasDeUso
    };
    int id = await db.insert('medicamento', medicamento, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    notifyListeners();
    return Medicamento(id: id,
        idPaciente: pacientId, nome: name, dosagem: dosagem,
        tarja: tarja, dataInicial: dataIncio, diasDeUso: diasDeUso);
  }

  Future<List<Map<String, dynamic>>> _get(int id) async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> medicamento = db.query(
        'medicamento', where: "id = ?", whereArgs: [id], limit: 1);
    return medicamento;
  }

  Future<List<Map<String, dynamic>>> _getAll() async {
    final db = await DataBaseService.database();
    Future<List<Map<String, dynamic>>> medicamentos = db.query('medicamento');
    return medicamentos;
  }

  Future<int> update(int id, int pacientId, String name, double dosagem, String? tarja, DateTime? dataIncio, int? diasDeUso) async {
    final db = await DataBaseService.database();
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

  Future<void> delete(int id) async {
    final db = await DataBaseService.database();
    try {
      db.delete('medicamento', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      throw Exception("Falha ao deletar medicamento");
    }
    notifyListeners();
  }

   Future<List<Medicamento>> listAll() async {
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

  Future<Medicamento> getById(int id) async {
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