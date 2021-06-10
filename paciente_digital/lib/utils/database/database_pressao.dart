import 'package:paciente_digital/utils/database/database_utils.dart';
import 'package:paciente_digital/models/Medidas/pressao_arterial.dart';
import 'package:sqflite/sqflite.dart' as sql;


class DatabasePressao implements DbUtils{
  //Inserindo na tabela Pressão
  Future<void> insertNivelGlic(PressaoArterial pressao) async{
    sql.Database db;
    var resultado = await db.insert('pressao', pressao.toMap());
    return resultado;
  }

  //Retorna uma Pressao
  Future<PressaoArterial> getPressao(int id) async{
    sql.Database db;
    PressaoArterial pressao;
    List<Map<String, PressaoArterial>> maps = await db.query('pressao',
      columns: ['id' , 'idPaciente', 'pressaoMax', 'pressaoMin', 'date'],
      where: '${pressao.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return pressao.fromMap(maps.first);
    }else{
      return null;
    }
  }

//Deletar Pressao
  Future<int> deletePressao(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('pressao',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de Pressão
  Future<int> countPressao() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron pressao');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }

  @override
  Future close() {
    // TODO: implement close
    throw UnimplementedError();
  }



}