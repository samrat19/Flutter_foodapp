import 'package:sqflite/Util/network_util.dart';

class Rest_Data{

  Network_util network_util = Network_util();

  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL+"/";

  Future<User> login(String username, String password){
    return null;
  }
}