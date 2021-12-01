import 'package:flutter/material.dart';
import 'package:video-mobile/comments.dart';
import 'package:video-mobile/login_form.dart';

class Drawer extends StatefulWidget {
  const Drawer({ Key? key }) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView(
        children:[
          DrawerHeader(
            child:CircleAvatar(
             backgroundImage: NetworkImage(''), 
             radius: 50,
            ),
          ),
          ListTile(
           leading:Icon(Icons.logout),
           title:Text('logout'),
           onTap:(){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginForm()))
           }
          ),
          ListTile(
           leading:Icon(Icons.logout),
           title:Text(''),
           onTap:(){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>))
           }
          )  
        ]
      )
    );
  }
}