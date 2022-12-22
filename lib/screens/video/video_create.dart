import 'package:flutter/material.dart';
import 'package:video_mobile/services/video_create_service.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class VideoCreate extends StatefulWidget {
  const VideoCreate({super.key});

  @override
  State<VideoCreate> createState() => _VideoCreateState();
}

class _VideoCreateState extends State<VideoCreate> {

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
              controller: Provider.of<VideoCreateService>(context,listen:false).titleController,
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
              onPressed: ()=>Provider.of<VideoCreateService>(context,listen:false).captureImage(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0xffdc143d)),
              icon: Icon(Icons.file_upload),
              label: Text('upload image here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height: 10,),
            Text('video description',style: TextStyle(fontSize: 18)),
            SizedBox(height:10),
            TextFormField(
              controller: Provider.of<VideoCreateService>(context,listen:false).descriptionController,
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
              onPressed: ()=>Provider.of<VideoCreateService>(context,listen:false).captureVideo(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0xffdc143d)),
              icon: Icon(Icons.file_upload),
              label: Text('upload video here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height:10),
            MaterialButton(
              onPressed: ()=>Provider.of<VideoCreateService>(context,listen:false).submit(),
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