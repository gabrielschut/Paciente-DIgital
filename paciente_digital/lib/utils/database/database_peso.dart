import 'package:sqflite/sqflite.dart' as sql;
import 'package:paciente_digital/utils/database/database_utils.dart';
import 'package:paciente_digital/models/Medidas/peso.dart';

class DatabasePeso implements DbUtils{
  //Inserindo na tabela Peso
  Future<void> insertPeso(Peso peso) async{
    sql.Database db;
    var resultado = await db.insert('peso', peso.toMap());
    return resultado;
  }

  //Retorna um Peso
  Future<Peso> getPeso(int id) async{
    sql.Database db;
    Peso peso;
    List<Map<String, Peso>> maps = await db.query('peso',
      columns: ['id' , 'idPaciente', 'peso','date'],
      where: '${peso.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return peso.fromMap(maps.first);
    }else{
      return null;
    }
  }

//Deletar Peso
  Future<int> deletePeso(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('peso',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de Pesos
  Future<int> countPeso() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron peso');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }


}