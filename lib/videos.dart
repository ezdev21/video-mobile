import 'package:flutter/material.dart';

class Videos extends StatefulWidget {
  const Videos({ Key? key }) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Container(
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