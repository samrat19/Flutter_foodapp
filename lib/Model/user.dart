class User{

  String _username;
  String _password;

  User(this._username,this._password);

  User.map(dynamic obj){
    this._username = obj['username'];
    this._password = obj['password'];
  }
}