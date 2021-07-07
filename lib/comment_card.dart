import 'package:flutter/material.dart';
import 'package:video/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  CommentCard({this.comment})

  @override
  Widget build(BuildContext context) {
    return Card(
     color:Colors.white,
     margin: EdgeInsets.all(10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
        Text(
           '${comment.user.name}',
           style:TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w600)
             ),
        Text(
           '${comment.body}',
           style:TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.w600)
             ),
        Row(
          children: [
          IconButton(
            onPressed: (){

            },
            color:comment.liked? Colors.green : Colors.white,
            icon:Icon(Icons.thumb_up),
            iconSize: 10,
          ),
          Text('${comment.totalLikes}'),
          IconButton(
            onPressed: (){

            },
            color:comment.liked? Colors.red : Colors.white,
            icon:Icon(Icons.thumb_down),
            iconSize: 10,
          ),
          Text('${comment.totalDislikes}'),
          ],
          ),
        TextButton(
          onPressed: (){

          },
          child: Text(
           'replay',
           style:TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.w600)
             ),)       
       ],
     ),
    );
  }
}