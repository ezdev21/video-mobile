import 'package:flutter/material.dart';

class ChannelPlaylists extends StatefulWidget {
  const ChannelPlaylists({ Key? key }) : super(key: key);

  @override
  _ChannelPlaylistsState createState() => _ChannelPlaylistsState();
}

class _ChannelPlaylistsState extends State<ChannelPlaylists> {
  
  void getPlaylistsData() async{
    Response response=get('https://127.0.0.1:8000/api/channel/playlists');
    playlists=jsonDecode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(
        itemCount: plylists.length,
        itemBuilder: (BuildContext context, int index) {
          return playlistCard(playlists[index]);
        },
      ),
    );
  }
}