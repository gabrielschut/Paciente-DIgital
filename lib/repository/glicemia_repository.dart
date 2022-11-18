import 'package:flutter/cupertino.dart';
import 'package:paciente_digital/model/afericoes/glicemia.dart';
import 'package:sqflite/sqflite.dart';
import '../db/database.dart';

class GlicemiaRepository  extends ChangeNotifier{
  late Database db;

  void _create(Glicemia glicemia) async{
    db = await AppDatabase.instance.database;

    db.insert('glicemia', {
      'id_paciente': glicemia.idPaciente,
      'create_at': glicemia.createA,
      'value': glicemia.value,
    });
    notifyListeners();
  }

  void _deleteById(int pacienteId) async  {
    db = await AppDatabase.instance.database;

    db.delete('glicemia', where: "glicemia.id = {$pacienteId}");
    notifyListeners();
  }

  Future<List<Glicemia>> _getAllByPacienteId(int pacienteId) async {
    db = await AppDatabase.instance.database;

    List glicemias =  await db.query('glicemia', where: "glicemia.id_paciente in ({$pacienteId})");
    List<Glicemia> allGlicemias = [];

    glicemias.forEach((element) {
      Glicemia glicemia = Glicemia(
        id: element['id'],
          idPaciente: element['id_paciente'],
          createA: element['create_at'],
          value: element['value']);
      allGlicemias.add(glicemia);
    });

    return allGlicemias;
  }
}