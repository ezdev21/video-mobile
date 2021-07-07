import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({ Key? key }) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
        Image(
          image:NetworkImage('$'),
        ),
        Row(
        children:[
          CircleAvatar(
           backgroundImage:NetworkImage('$'),
           radius: 20,
          ),
          Text(
            '${video.title}',
            style:TextStyle(
              fontSize:18
            ),
          )
        ]
      ), 
      Text(
        '${channel.name}',
        style:TextStyle(
          fontSize:16
        ),
      )
      Text(
        '${video.views} views .${video.date}',
        style:TextStyle(
          fontSize:14
        ),
      )
        ],
      ),
    );
  }
}