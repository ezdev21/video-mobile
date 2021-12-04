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
      child:
    );
  }
}