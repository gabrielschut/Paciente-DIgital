class User{
  int id;
  String login;
  String passWord;

  User([
    this.id,
    this.login,
    this.passWord,
]);

  void _setSenha(String novaSenha){
    this.passWord = novaSenha;
  }

  String get recuperandoLogin{
    return login;
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'passWord': passWord,
      'login': login,
    };
    return map;
  }

  Future<User> fromMap(Map<String, dynamic> map) async{
    User user;
    user.id = map['id'];
    user.login = map['login'];
    user.passWord = map['passWord'];

    return user;
  }
}