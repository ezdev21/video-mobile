import 'package:flutter/material.dart';
import 'package:video_mobile/models/playlist.dart';

class PlaylistCard extends StatefulWidget {
  playlist playlist=Playlist()
  PlaylistCard({Key? key,this.playlist}) : super(key: key);

  @override
  _PlaylistCardState createState() => _PlaylistCardState();
}

class _PlaylistCardState extends State<PlaylistCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
       children:[
         Positioned(
          child:Text('${playlist.name}',style:TextStyle(fontSize:25))
         ),
         Positioned(
           child:Image(
             image:NetworkImage('http://127.0.0.1:8000/storage/channels/${channel.picture}}')
           )
         )
       ]
      )
    );
  }
}