import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_mobile/services/dio.dart';

class ChannelCreateProvider extends ChangeNotifier{
  final nameController=TextEditingController();
  final descriptionController=TextEditingController();
  var image;
  
  Future captureImage() async{
    final result=await FilePicker.platform.pickFiles();
    image=result!.files.first;
  }

  TextEditingController getNameController(){
    return descriptionController;
  }

  TextEditingController getDescriptionController(){
    return nameController;
  }

  void showToast(String status){
    Fluttertoast.showToast(
      msg: status=="success"? "new channel created successfully!" : "error occured while creating new channel",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: status=="success"? Color(0Xff43db80) : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  } 

  Future submit() async{
    try{
      dio().post('/channel/create',data:{
        'name':nameController.text,
        'description':descriptionController.text,
        'image':image
      });
      showToast("success");
    }catch(e){
      showToast("error");
    }
    notifyListeners();
  }

}