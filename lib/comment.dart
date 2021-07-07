import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  const Comment({ Key? key }) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Text('comment as $user.name',
          style:TextStyle(
           fontSize: 20,
           fontWeight:FontWeight.w500 
          )
          ),
          TextField(
           decoration: InputDecoration(
             border: OutlineInputBorder(),
             hintText: 'comment here'
           ), 
          ),
          ListTile(
            leading: Text(comment.name),
            body:

          )
        ],
      )
    );
  }
}