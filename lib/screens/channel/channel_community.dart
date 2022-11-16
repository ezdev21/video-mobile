import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/services/dio.dart';

class ChannelCommunity extends StatefulWidget {
  const ChannelCommunity({super.key});

  @override
  State<ChannelCommunity> createState() => _ChannelCommunityState();
}

class _ChannelCommunityState extends State<ChannelCommunity> {
  dynamic channels;
  late Channel channel;
  @override
  void initState() {
    getChannels();
    super.initState();
  }

  Future getChannels() async{
    Response res=await dio().get('/channel/${channel.id}/featured-channels');
    channels=res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text('featured channels',style: TextStyle(fontFamily: 'Pacifico',fontSize: 25,fontWeight: FontWeight.w500),),
          ListView.builder(
            itemCount: channels.length,
            itemBuilder: ((context, index) {
              var channel=channels[index];
              return Row(
                children: [
                  channel.url?
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('${channel.url}'),
                  )
                  :CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xffdc143d),
                    child: Center(
                      child: Text('getInitials(${channel.name.toUpperCase()})',style: TextStyle(color: Colors.white,fontSize: 40),),
                    )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${channel.name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                      Text('${channel.description}',style: TextStyle(color: Colors.grey[600]),)
                    ],
                  )
                ],
              );
            })
          )
        ]
      ),
    );
  }
}