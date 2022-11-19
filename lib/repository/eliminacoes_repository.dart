import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/eliminacoes.dart';
import 'package:sqflite/sqflite.dart';

import '../db/database.dart';

class EiminacoesRepository extends ChangeNotifier{
  late Database db;

  void _crete(Eliminacoes eliminacao) async {
    db = await AppDatabase.instance.database;
     db.insert('eliminacoes', {
       'id_paciente': eliminacao.idPaciente,
       'create_at': eliminacao.createAt,
       'excrecao': eliminacao.excrecao,
       'descricao': eliminacao.description,
     });
     notifyListeners();
  }

  void _deleteById(int id) async {
    db = await AppDatabase.instance.database;
    db.delete('eliminacoes' ,where: "eliminacoes.id = {$id}");
    notifyListeners();
  }

  Future<List<Eliminacoes>> _getAllByPacienteId(int pacienteId) async{
    db = await AppDatabase.instance.database;

    List eliminacoes = await db.query('eliminacoes',
        where: "eliminacoes.id_paciente in ({$pacienteId})");

    List<Eliminacoes> allEliminacoes = [];
    eliminacoes.forEach((element) {
      Eliminacoes eliminacao = Eliminacoes(
          id: element['id'],
          idPaciente: element['id_paciente'],
          createAt: element['create_at'],
          excrecao: element['excrecao'],
          description: element['descricao']);
      allEliminacoes.add(eliminacao);
    });
    return allEliminacoes;
  }

}