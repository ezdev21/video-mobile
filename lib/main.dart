import 'package:flutter/material.dart';
import 'package:video/video_watch.dart';
import 'package:video/videos.dart';
import 'package:video/drawer.dart';
import 'package:video/channel_page.dart';

void main()=>runApp(MaterialApp(
  initialRoute:'/loading',
  routes:{
    '/loading': (context) => Loading(),
    '/' : (context) => Videos(),
    '/video/watch${video.id}' : (context) => VideoWatch(),
    '/video/upload' : (context) => VideoUpload(),
    'channel/show/${channel.id}' : (context) => ChannelPage()
  }
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[200],
     drawer:Drawer(), 
     appBar: AppBar(
      title:Text(
        'video sharing',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.white,
        ),),
      centerTitle: true,
      backgroundColor: Colors.crimson[600],
     ),
     body: Videos(),
    );
  }
}