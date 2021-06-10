import 'package:sqflite/sqflite.dart' as sql;
import 'package:paciente_digital/models/medicamentos.dart';
import 'package:paciente_digital/utils/database/database_utils.dart';

class DatabaseMedicameto implements DbUtils{
  //Inserindo na tabela Medicamento
  Future<void> insertMedicamento(Medicamento medicamento) async{
    sql.Database db;
    var resultado = await db.insert('medicamentos', medicamento.toMap());
    return resultado;
  }

  //Retorna um Medicamento
  Future<Medicamento> getMedicamento(int id) async{
    sql.Database db;
    Medicamento medicamento;
    List<Map<String, Medicamento>> maps = await db.query('medicamentos',
      columns: ['id' , 'idPaciente','nome','dataInicio', 'dataFim'],
      where: '${medicamento.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return medicamento.fromMap(maps.first);
    }else{
      return null;
    }
  }

//  Atualizando Medicamento
  Future<int> updateMedicamento(Medicamento medicamento) async{
    sql.Database db;

    var resultado = await db.update(
      'medicamentos',
      medicamento.toMap(),
      where: '${medicamento.id} = ?',
      whereArgs:  [medicamento.id],
    );

    return resultado;
  }

//Deletar Medicamento
  Future<int> deleteMedicamento(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('medicamentos',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de Medicamento
  Future<int> countMedicamento() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron medicamentos');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }
}