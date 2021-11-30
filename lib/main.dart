import 'package:flutter/material.dart';
import 'package:video/videoplayer.dart';
import 'package:video/videos.dart';
import 'package:video/drawer.dart';

void main()=>runApp(MyApp());

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
      backgroundColor: Colors.red,
     ),
     body: Videos(),
    );
  }
}
void main()=>runApp(MaterialApp(
  home:Videos(),
  routes:{
    '/video/show':(context)=>VideoPlayer(),
    '/channel/show':(context)=>Channel();
  }
));
GestureDetector(
  onTap(),
)
void getdata(){
  Future.delayed(Duration(seconds: 5),(){

 });
}