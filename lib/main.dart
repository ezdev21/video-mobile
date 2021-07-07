import 'package:flutter/material.dart';
import 'package:video/videos.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer:Drawer(), 
     appBar: AppBar(
      title:Text('video sharing'),
      centerTitle: true,
      backgroundColor: Colors.red,
     ),
     body: Videos(),
    );
  }
}