import 'package:sqflite/sqflite.dart' as sql;
import 'package:paciente_digital/utils/database/database_utils.dart';
import 'package:paciente_digital/models/Medidas/circunferencial_abdominal.dart';

class DatabaseCircAbdominal implements DbUtils{

  //Inserindo na tabela circAbdominal
  Future<void> insertCirc(CircunferenciaAbdominal circ) async{
    sql.Database db;
    var resultado = await db.insert('circAbdominal', circ.toMap());
    return resultado;
  }

  //Retorna uma CircunferenciaAbdominal
  Future<CircunferenciaAbdominal> getCirc(int id) async{
    sql.Database db;
    CircunferenciaAbdominal circ;
    List<Map<String, CircunferenciaAbdominal>> maps = await db.query('circAbdominal',
      columns: ['id' , 'idPaciente', 'circunferencia','date'],
      where: '${circ.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return circ.fromMap(maps.first);
    }else{
      return null;
    }
  }


//Deletar CircunferenciaAbdominal
  Future<int> deleteCirc(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('circAbdominal',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de CircunferenciaAbdominal
  Future<int> countCirc() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron circAbdominal');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }


}