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
      image:Image.network(),
      child:Row(
        children:[
          CircleAvatar(

          ),
          Text(
            '${video.title}',
            style:TextStyle(
              fontSize:18
            ),
          )
          Text(
            '${video.views} views',
            style:TextStyle(
              fontSize:18
            ),
          )
        ]
      )
    );
  }
}