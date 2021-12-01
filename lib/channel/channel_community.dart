import 'package:flutter/material.dart';
import 'package:htp/http.dart';
import 'package:video-mobile/models/channel.dart';
import 'package:video-mobile/channel/post_template.dart';
import 'dart:convert';

class ChannelCommunity extends StatefulWidget {
  const ChannelCommunity({ Key? key }) : super(key: key);

  @override
  _ChannelCommunityState createState() => _ChannelCommunityState();
}

class _ChannelCommunityState extends State<ChannelCommunity> {
  Channel channel;
  List<Post> posts;
  bool error=false;

  getChannelPosts() async{
   try{
    Response response=await get('http://127.0.0.1:8000/channel/json_community',{channel:channel});
    dynamic post=jsonDecode(response.body);
   }
   catch(e){
     error=false;
   }
  }

  @override
  void initState() {
    super.initState();
    getChannelPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostTemplate(posts[index]);
          },
        ),
      )     
    );
  }
}