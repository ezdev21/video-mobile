import 'package:flutter/material.dart';

class LikeModal extends StatelessWidget {
  const LikeModal({Key? key}) : super(key: key);

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