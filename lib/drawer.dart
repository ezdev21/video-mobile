import 'package:flutter/material.dart';
import 'package:video/comments.dart';
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

           }
          ),
          ListTile(
           leading:Icon(Icons.logout),
           title:Text(''),
           onTap:(){

           }
          )  
        ]
      )
    );
  }
}