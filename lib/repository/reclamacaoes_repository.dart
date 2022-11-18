import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/reclamacoes.dart';
import 'package:sqflite/sqflite.dart';
import '../db/database.dart';

class ReclamacoesRepository extends ChangeNotifier{
  late Database db;

  Future<List<Reclamacoes>> _getAllByPaciente(int pacienteId) async{
    db = await AppDatabase.instance.database;
    List AllReclamacoes = await db.query('reclamacoes', where: "reclamacoes.id_paciente in ({$pacienteId})");
    List<Reclamacoes> reclamacoes = [];

    AllReclamacoes.forEach((element) {
      Reclamacoes reclamacao = Reclamacoes(
          id: element['id'],
          idPaciente: element['id_paciente'],
          createAt: element['create_at'],
          reclamacao: element['reclamacao']);
      reclamacoes.add(reclamacao);
    });
    notifyListeners();
    return reclamacoes;
  }

  void _create(Reclamacoes reclamacao) async{
    db.insert('reclamacoes', {
      'id_paciente':reclamacao.idPaciente,
      'create_at' : reclamacao.createAt,
      'reclamacao' : reclamacao.reclamacao,
    });
    notifyListeners();
  }

  void _deleteById(int id) async {
    db.delete('reclamacoes', where: "reclamacoes.id = {$id}");
    notifyListeners();
  }

}