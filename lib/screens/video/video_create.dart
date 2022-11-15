import 'dart:html';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class VideoCreate extends StatefulWidget {
  const VideoCreate({super.key});

  @override
  State<VideoCreate> createState() => _VideoCreateState();
}

class _VideoCreateState extends State<VideoCreate> {
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
  
  Future submit() async{
    try{
     Dio().post('/video/store',data:{
    'title':titleController.text,
    'description':descriptionController.text,
    'image':image,
    'video':video
  }); 
    }catch(e){
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('upload a new video here',textAlign: TextAlign.center, style: TextStyle(fontSize: 25,fontFamily: 'Pacifico'),),
            SizedBox(height: 10,),
            Text('video title',style: TextStyle(fontSize: 18),),
            SizedBox(height:10),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'video title',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0xffdc143d)),
                  borderRadius:BorderRadius.circular(5)
                ),
              )
            ),
            SizedBox(height:10),
            Text('upload image',style: TextStyle(fontSize: 18)),
            TextButton.icon(
              onPressed: ()=>captureImage(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0xffdc143d)),
              icon: Icon(Icons.file_upload),
              label: Text('upload image here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height: 10,),
            Text('video description',style: TextStyle(fontSize: 18)),
            SizedBox(height:10),
            TextFormField(
              controller: descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'description',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0xffdc143d)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextButton.icon(
              onPressed: ()=>captureVideo(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0xffdc143d)),
              icon: Icon(Icons.file_upload),
              label: Text('upload video here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height:10),
            MaterialButton(
              onPressed: ()=>submit(),
              child: Text('Submit',style: TextStyle(fontSize: 18),),
              color: Color(0xffdc143d),
              height: 50,
              textColor: Colors.white,
              minWidth: double.infinity,
              padding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}