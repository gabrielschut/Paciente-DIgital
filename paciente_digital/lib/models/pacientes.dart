class Paciente {
  int _id;
  int _idUser;
  String _nome;
  String _sexo;
  int _idade;

  Paciente([this._nome, this._sexo, this._id, this._idUser, this._idade]);

  int get id => _id;

 Map<String, dynamic> toMap() {
    var map = Map<String,dynamic>();
    map['id'] = _id;
    map['idUser'] = _idUser;
    map['nome'] = _nome;
    map['sexo'] = _sexo;
    map['idade'] = _idade;

    return map;
  }
  Future<Paciente> fromMap(Map<String, dynamic> map) async{
    Paciente paciente;
    paciente._id = map['id'];
    paciente._idUser = map['idUser'];
    paciente._nome = map['nome'];
    paciente._sexo = map['sexo'];
    paciente._idade = map['idade'];

    return paciente;
  }

}
