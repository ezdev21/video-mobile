import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class ChannelCreate extends StatefulWidget {
  const ChannelCreate({super.key});

  @override
  State<ChannelCreate> createState() => _ChannelCreateState();
}

class _ChannelCreateState extends State<ChannelCreate> {
  final nameController=TextEditingController();
  final descriptionController=TextEditingController();
  var image;
  Future captureImage() async{
    final result=await FilePicker.platform.pickFiles();
    image=result!.files.first;
  }

  Future submit() async{
    try{
      dio().post('/channel/create',data:{
        'name':nameController.text,
        'description':descriptionController.text,
        'image':image
      });
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:AppDrawer(),
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('create a new channel',textAlign: TextAlign.center, style: TextStyle(fontSize: 25,fontFamily: 'Pacifico'),),
            SizedBox(height: 10,),
            Text('channel name',style: TextStyle(fontSize: 18),),
            SizedBox(height:10),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'channel title',
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
            Text('upload channel image',style: TextStyle(fontSize: 18)),
            TextButton.icon(
              onPressed: ()=>captureImage(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0xffdc143d)),
              icon: Icon(Icons.file_upload),
              label: Text('upload image here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height: 10,),
            Text('channel description',style: TextStyle(fontSize: 18)),
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