class User{
  int _id;
  String _login;
  String _passWord;

  User([
    this._id,
    this._login,
    this._passWord,
]);

  void set setSenha(String novaSenha){
   _passWord = novaSenha;
  }

  String get recuperandoLogin{
    return _login;
  }

  Future<User> fromMap(Map<String, dynamic> map) async{
    User user;
    user._id = map['id'];
    user._login = map['login'];
    user._passWord = map['passWord'];

    return user;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String,Object>();
    map['id'] = _id;
    map['login'] = _login;
    map['passWord'] = _passWord;

    return map;
  }
}