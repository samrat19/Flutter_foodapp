import 'package:flutter/material.dart';

class Network_util{
  
  static Network_util _instance = Network_util.internal();
  Network_util.internal();
  factory Network_util() => _instance;

  Future<dynamic> get(){
    // when we press the login button the request will go here and call the rest api
  } 
}