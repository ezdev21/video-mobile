import 'package:flutter/material.dart';
import 'package:video/videos.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title:Text('video sharing'),
     ),
     body: Videos(),
    );
  }
}  