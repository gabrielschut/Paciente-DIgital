import 'package:sqflite/sqflite.dart' as sql;
import 'package:paciente_digital/utils/database/database_utils.dart';
import 'package:paciente_digital/models/Medidas/nivel_glicemia.dart';

class DatabaseGlicemia implements DbUtils{

  //Inserindo na tabela NivelGlicemia
  Future<void> insertNivelGlic(NivelGlicemia nivel) async{
    sql.Database db;
    var resultado = await db.insert('glicemia', nivel.toMap());
    return resultado;
  }

  //Retorna uma NivelGlicemia
  Future<NivelGlicemia> getNivelGlic(int id) async{
    sql.Database db;
    NivelGlicemia nivel;
    List<Map<String, NivelGlicemia>> maps = await db.query('glicemia',
      columns: ['id' , 'idPaciente', 'glicemia','date'],
      where: '${nivel.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return nivel.fromMap(maps.first);
    }else{
      return null;
    }
  }

//Deletar NivelGlicemia
  Future<int> deleteNivelGlic(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('glicemia',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de NivelGlicemia
  Future<int> countNivelGlic() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron glicemia');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }


}