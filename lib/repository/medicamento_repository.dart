import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import '../db/database.dart';
import '../model/medicamento.dart';

class MedicamentoRepository extends ChangeNotifier {
  late Database db;

  Future<Medicamento> _getById(int id) async {
    db = await AppDatabase.instance.database;
    List medicamento =
        await db.query('reclamacoes', where: "medicamento.id in ({$id})");

    Medicamento medicamentoReturn = Medicamento(
        idPaciente: medicamento.first['id_paciente'],
        nome: medicamento.first['nome'],
        dosagem: medicamento.first['dosagem'],
        dataInicial: medicamento.first['data_inicio'],
        dataTermino: medicamento.first['data_termino']);
    notifyListeners();
    return medicamentoReturn;
  }

  Future<List<Medicamento>> _getAllByPaciente(int pacienteId) async {
    db = await AppDatabase.instance.database;
    List medicamentos = await db.query('medicamento',
        where: "medicamento.id_paciente in ({$pacienteId}_");
    List<Medicamento> listMedicamentos = [];

    medicamentos.forEach((element) {
      Medicamento medicamento = Medicamento(
          id: element['id'],
          idPaciente: element['id_paciente'],
          nome: element['nome'],
          dosagem: element['dosagem'],
          dataInicial: element['data_inicio'],
          dataTermino: element['data_termino']);
      listMedicamentos.add(medicamento);
    });
    notifyListeners();
    return listMedicamentos;
  }

  void _create(Medicamento medicamento) async{
    db = await AppDatabase.instance.database;

    db.insert('medicamento', {
      'id_paciente': medicamento.idPaciente,
      'nome': medicamento.nome,
      'dosagem': medicamento.dosagem,
      'data_inicio': medicamento.dataInicial,
      'data_termino': medicamento.dataTermino
    });
    notifyListeners();
  }

  void _deleteByid(int id) async{
    db = await AppDatabase.instance.database;

    db.delete('medicamento', where: "medicamento.id = {$id}");
    notifyListeners();
  }
}
