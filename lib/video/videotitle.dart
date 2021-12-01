import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoTitle extends StatefulWidget {
  const VideoTitle({ Key? key }) : super(key: key);

  @override
  _VideoTitleState createState() => _VideoTitleState();
}

class _VideoTitleState extends State<VideoTitle> {
  final video={};
  getVideoTitle() async{
    var data=await http.get('');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
     child:Column(
       children:<Widget>[
        Text('${video.title}',
          style:TextStyle(fontSize:20)), 
        Row(
          children:[
          Text('${video.views} views',
          style:TextStyle(fontSize:20)),
          Text('${video.date}',
          style:TextStyle(fontSize:20)),
          IconButton(
            onPressed:(){
             
            },
            icon: Icon(Icons.thumb_up),
            iconSize: 40,
            color: video.liked? Colors.green : Colors.white
            ),
          Text('${video.likes}',
          style:TextStyle(fontSize:20)),
          IconButton(
            onPressed:(){
             
            },
            icon: Icon(
              Icons.thumb_down),
              iconSize: 40,
            color: video.disliked? Colors.red : Colors.white
            ),
          Text('${video.dislikes}',
          style:TextStyle(fontSize:20)),
          ],  
         ),
         Divider(
          height:40, 
          color: Colors.grey[400],)
       ]
     )
    );
  }
}