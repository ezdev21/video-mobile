import 'package:flutter/material.dart';
import 'package:video-mobile/services/login_form.dart';
import 'package:video-mobile/service/register_form.dart';

class SubscribeModal extends StatelessWidget {
  const SubscribeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
       children:[
         Text('want to subscribe this channel',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
         SizedBox(height:20),
         Text('sign in to subscribe and get latest notifications',style:TextStyle(fontSize:20,fontWeight:FontWeight.semibold)),
         SizedBox(height:20),
         Row(
           children:[
             TextButton(
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginFrm()))
                },
                color:Colors.blue,
                child:Text('sign in',style:TextStyle(color:Colors.white,fontSize:20))
              ),
              SizedBox(width:20),
              Text('or',style:TextStyle(fontSize:30))
              SizedBox(width:20);
              TextButton(
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=RegisterForm()))
                },
                color:Colors.blue,
                child:Text('sign up',style:TextStyle(color:Colors.white,fontSize:20))
              ),
           ]
         )
       ]
      )
    );
  }
}