import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
//import 'package:device_info_plus/device_info_plus.dart';

class Auth extends ChangeNotifier{
  late User user;
  bool logged=false;
  String token='';
  final storage = new FlutterSecureStorage();

  bool get authenticated => logged;
  User get getUser => user;
  
  void register(Map creds) async{
    try{
      var res=Dio().post('sanctum/register',data:creds);
    }catch(e){
      print(e);
    }
  } 

  void login(Map creds) async{
    try {
     var res=await Dio().post('/sanctum/token',data:creds);
     token=res.data.toString();
     tryToken(token);
     logged=true;
    }catch(e){
      
    }
    notifyListeners();
  }

  tryToken(token) async{
    if(token==null){
      return;
    }
    else{
      try{
        var res=await Dio().get('/user',options:Options(headers:{'Authorization':'Bearer $token'}));
        this.logged=true;
        this.user=User.fromJson(res.data);
        this.token=token;
        storeToken(token);
        notifyListeners(); 
      }catch(e){
        
      }
    }
  }
  
  void storeToken(token){
    storage.write(key: 'token', value: token);   
  }

  void logout() async{
    try{
      var res=await Dio().get('/user/revoke',options:Options(headers:{'Authorization':'Bearer $token'}));
      cleanUp();
      notifyListeners(); 
    }catch(e){
      
    }
  }

  void cleanUp() async{
    //user=null;
    logged=false;
    //token=null;
    await storage.delete(key: 'token');
  }

  getDeviceInfo() async{
    String device_name='';
    if(Platform.isAndroid){
      //DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      //AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      //device_name=androidInfo.model;
    }
    else if(Platform.isIOS){
      //IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      //device_name=iosInfo.utsname.machine;
    }
    else{
      device_name='unknown';
    }
    return device_name;
  }
}