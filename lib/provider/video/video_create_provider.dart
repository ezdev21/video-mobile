import 'package:flutter/material.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoCreateProvider extends ChangeNotifier{
  final titleController=TextEditingController();
  final descriptionController=TextEditingController();
  PlatformFile? image,video;

  Future captureImage() async{
    final result=await FilePicker.platform.pickFiles();
    final image=result!.files.first;
  }

  Future captureVideo() async{
    final result=await FilePicker.platform.pickFiles();
    final video=result!.files.first;
  }

  void showToast(String status){
    Fluttertoast.showToast(
      msg: status=="success"? "boom! new video posted" : "error occured while uploading new video",
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
     dio().post('/video/store',data:{
       'title':titleController.text,
       'description':descriptionController.text,
       'image':image,
       'video':video
    });
    showToast("success");
    }catch(e){
      showToast("error");
    }
  }
}