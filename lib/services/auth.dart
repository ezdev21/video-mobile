
import 'package:flutter/material.dart';

class Auth extends ChangeNotifier{
  bool logged=false;

  bool get authenticated => logged;

  void login(Map creds){
    logged=true;
    notifyListeners();
  }
  void logout(){
    logged=false;
    notifyListeners();
  }
}