import 'package:paciente_digital/utils/database/database_utils.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:paciente_digital/models/pacientes.dart';

class DataBasePaciente implements DbUtils{

  //Inserindo na tabela Paciente
  Future<void> insertPaciente(Paciente paciente) async{
    sql.Database db;
    var resultado = await db.insert('pacientes', paciente.toMap());
    return resultado;
  }

  //Retorna um Paciente
  Future<Paciente> getPaciente(int id) async{
    sql.Database db;
    Paciente paciente;
    List<Map<String, Paciente>> maps = await db.query('pacientes',
      columns: ['id' , 'idUser', 'idade','sexo','nome'],
      where: '${paciente.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return paciente.fromMap(maps.first);
    }else{
      return null;
    }
  }

//  Atualizando Paciente
  Future<int> updatePaciente(Paciente paciente) async{
    sql.Database db;

    var resultado = await db.update(
      'pacientes',
      paciente.toMap(),
      where: '${paciente.id} = ?',
      whereArgs:  [paciente.id],
    );

    return resultado;
  }

//Deletar Paciente
  Future<int> deletePaciente(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('paciente',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de Pacientes
  Future<int> countPaciente() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron pacientes');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }

}