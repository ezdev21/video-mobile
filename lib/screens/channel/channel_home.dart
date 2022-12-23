import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/provider/channel/channel_home_provider.dart';
import 'package:video_mobile/screens/video/video_show.dart';
import 'package:video_player/video_player.dart';

class ChannelHome extends StatefulWidget {
  const ChannelHome({super.key});

  @override
  State<ChannelHome> createState() => _ChannelHomeState();
}

class _ChannelHomeState extends State<ChannelHome> {
  
  @override
  void initState() {
    Provider.of<ChannelHomeProvider>(context,listen:false).getChannelVideos();
    if(Provider.of<ChannelHomeProvider>(context,listen:false).homeVideo){
      playVideo();
    }
    super.initState();
  }
  
  @override
  void dispose() {
    Provider.of<ChannelHomeProvider>(context,listen:false).vpcontroller.dispose();
    super.dispose();
  } 
  
  void playVideo({int index=0,bool init=false}){
    Provider.of<ChannelHomeProvider>(context,listen:false).vpcontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..setLooping(Provider.of<ChannelHomeProvider>(context,listen:false).looping)
      ..initialize().then((_) {
        Provider.of<ChannelHomeProvider>(context,listen:false).vpcontroller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${Provider.of<ChannelHomeProvider>(context,listen:false).channel.name}',style: TextStyle(color:Colors.grey[600],fontSize: 25,fontFamily: 'Pacifico',fontWeight: FontWeight.w500),),
          Text('${Provider.of<ChannelHomeProvider>(context,listen:false).channel.description}'),
          Provider.of<ChannelHomeProvider>(context,listen:false).homeVideo?
           AspectRatio(
            aspectRatio: 1.75,
            child: VideoPlayer(Provider.of<ChannelHomeProvider>(context,listen:false).vpcontroller)
          )
          :SizedBox(),
          ListView.builder(
          itemCount: Provider.of<ChannelHomeProvider>(context,listen:false).pinnedVideos.length,
          itemBuilder: (context,index){
            var video=Provider.of<ChannelHomeProvider>(context,listen:false).pinnedVideos[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoShow()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      width:MediaQuery.of(context).size.width/2,
                      '${video.image}'
                    ),
                    SizedBox(width: 5,),
                    Column(
                      children: [
                        Text('${video.title}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                        Text('${video.description}',style: TextStyle(fontSize: 16,color: Colors.grey[700])),
                      ],
                    )
                  ],
                ), 
              ),
            );
          }
          ),
        ],
      )
    ); 
  }
}