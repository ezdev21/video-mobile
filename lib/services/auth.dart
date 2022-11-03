
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Auth extends ChangeNotifier{
  bool logged=false;

  bool get authenticated => logged;

  void login(Map creds){
    try {
     Dio().post('/sanctum/token',data:creds);
     logged=true; 
    }catch(e){
      
    }
    notifyListeners();
  }
  void logout(){
    logged=false;
    notifyListeners();
  }
}