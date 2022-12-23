import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/provider/channel_create_provider.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class ChannelCreate extends StatefulWidget {
  const ChannelCreate({super.key});

  @override
  State<ChannelCreate> createState() => _ChannelCreateState();
}

class _ChannelCreateState extends State<ChannelCreate> {

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
            Align(
              alignment: Alignment.center,
              child: Text('create a new channel', style: TextStyle(color:Colors.grey[600],fontSize: 25,fontFamily: 'Pacifico'),)
            ),
            SizedBox(height: 10,),
            Text('channel name',style: TextStyle(fontSize: 18),),
            SizedBox(height:10),
            TextFormField(
              controller: Provider.of<ChannelCreateProvider>(context,listen:false).getNameController(),
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
              onPressed: ()=>Provider.of<ChannelCreateProvider>(context,listen:false).captureImage(),
              style: TextButton.styleFrom(padding: EdgeInsets.all(15), foregroundColor: Colors.white, backgroundColor: Color(0xffdc143d)),
              icon: Icon(Icons.file_upload),
              label: Text('upload image here',style: TextStyle(fontSize: 18))
            ),
            SizedBox(height: 10,),
            Text('channel description',style: TextStyle(fontSize: 18)),
            SizedBox(height:10),
            TextFormField(
              controller: Provider.of<ChannelCreateProvider>(context,listen:false).getDescriptionController(),
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
              onPressed: ()=>Provider.of<ChannelCreateProvider>(context,listen:false).submit(),
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