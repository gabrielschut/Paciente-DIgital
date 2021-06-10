import 'package:paciente_digital/utils/database/database_utils.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:paciente_digital/models/user.dart';

mixin DatabaseUser implements DbUtils {

//Inserindo na tabela usuário
  Future<void> insertuser(User usuario) async{
    sql.Database db;
    var resultado = await db.insert('user', usuario.toMap());
    return resultado;
  }

  //Retorna um usuário
  Future<User> getUsuario(int id) async{
    sql.Database db;
    User user;
    List<Map<String, dynamic>> maps = await db.query('user',
      columns: ['id' , 'login', 'passWord'],
      where: '${user.id} = ?',
      whereArgs: [id],
    );
    if(maps.length >0){
      return user.fromMap(maps.first);
    }else{
      return null;
    }
  }

//  Atualizando Usuário
  Future<int> updateUser(User user) async{
    sql.Database db;

    var resultado = await db.update(
      'user',
      user.toMap(),
      where: '${user.id} = ?',
      whereArgs:  [user.id],
    );

    return resultado;
  }

//Deletar usuário
  Future<int> deleteUser(int id) async{
    sql.Database db;

    int resultado =
    await db.delete('user',
      where: "id = ?",
      whereArgs: [id],
    );

    return resultado;
  }

//Obtem o número de usuários
  Future<int> countUser() async{
    sql.Database db;

    List<Map<String,dynamic>> x =await db.rawQuery('SELECT COUNT (*) fron user');
    int resultado = sql.Sqflite.firstIntValue(x);
    return resultado;
  }
}