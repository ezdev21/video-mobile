import 'package:flutter/material.dart';
import 'package:video_mobile/screens/channel/channel_community.dart';
import 'package:video_mobile/screens/channel/channel_home.dart';
import 'package:video_mobile/screens/channel/channel_short.dart';
import 'package:video_mobile/screens/channel/channel_video.dart';
import 'package:video_mobile/screens/post/channel_post.dart';
import 'package:video_mobile/widgets/app_drawer.dart';

class ChannelShow extends StatefulWidget {
  const ChannelShow({super.key});

  @override
  State<ChannelShow> createState() => _ChannelShowState();
}

class _ChannelShowState extends State<ChannelShow> with SingleTickerProviderStateMixin{
  final searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer:AppDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xffdc143d),
          title: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText:'search videos channels...',
                fillColor:Colors.white,
                filled: true,
                hintText: 'search videos channels...'
              ),
            ),
          centerTitle: true,
          actions:[
            IconButton(
              onPressed: (){
                //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchController.text})));
              },
              icon:Icon(Icons.search)
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home',icon:Icon(Icons.home)),
              Tab(text: 'Video',icon:Icon(Icons.videocam)),
              Tab(text: 'Post',icon:Icon(Icons.info)),
              Tab(text: 'Short',icon:Icon(Icons.short_text)),
              Tab(text: 'Community',icon:Icon(Icons.family_restroom)),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            ChannelHome(),
            ChannelVideo(),
            ChannelPost(),
            ChannelShort(),
            ChannelCommunity()
          ],
        ),
      ),
    );
  }
}
