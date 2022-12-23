import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/provider/channel/channel_community_provider.dart';

class ChannelCommunity extends StatefulWidget {
  const ChannelCommunity({super.key});

  @override
  State<ChannelCommunity> createState() => _ChannelCommunityState();
}

class _ChannelCommunityState extends State<ChannelCommunity> {
  
  @override
  void initState() {
    Provider.of<ChannelCommunityProvider>(context,listen: false).fetchChannels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text('featured channels',style: TextStyle(fontFamily: 'Pacifico',fontSize: 25,fontWeight: FontWeight.w500),),
          ListView.builder(
            itemCount: Provider.of<ChannelCommunityProvider>(context,listen: false).channels.length,
            itemBuilder: ((context, index) {
              var channel=Provider.of<ChannelCommunityProvider>(context,listen: false).channels[index];
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