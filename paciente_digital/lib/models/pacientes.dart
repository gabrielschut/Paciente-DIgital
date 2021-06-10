class Paciente {
  int id;
  int idUser;
  String nome;
  String sexo;
  int idade;

  Paciente([this.nome, this.sexo, this.id, this.idUser, this.idade]);

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id' : id,
      'idUser' : idUser,
      'idade': idade,
      'sexo' : sexo,
      'nome': nome,
    };
    return map;
  }

  Future<Paciente> fromMap(Map<String, dynamic> map) async{
    Paciente paciente;
    paciente.id = map['id'];
    paciente.idUser = map['idUser'];
    paciente.nome = map['nome'];
    paciente.sexo = map['sexo'];
    paciente.idade = map['idade'];

    return paciente;
  }

}
