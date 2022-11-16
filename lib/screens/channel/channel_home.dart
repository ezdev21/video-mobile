import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/screens/video/video_show.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_player/video_player.dart';

class ChannelHome extends StatefulWidget {
  const ChannelHome({super.key});

  @override
  State<ChannelHome> createState() => _ChannelHomeState();
}

class _ChannelHomeState extends State<ChannelHome> {
  bool homeVideo=true;
  late VideoPlayerController vpcontroller;
  bool looping=true;
  bool liked=false;
  bool disliked=false;
  dynamic pinnedVideos=[];
  late Channel channel;

  @override
  void initState() {
    getChannelVideos();
    if(homeVideo){
      playVideo();
    }
    super.initState();
  }
  
  @override
  void dispose() {
    vpcontroller.dispose();
    super.dispose();
  } 

  Future getChannelVideos() async{
    Response res=await dio().get('/channel/${channel.id}/viedos');
    pinnedVideos=res.data;
  }
  
  void playVideo({int index=0,bool init=false}){
    vpcontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..setLooping(looping)
      ..initialize().then((_) {
        vpcontroller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${channel.name}',style: TextStyle(color:Colors.grey[600],fontSize: 25,fontFamily: 'Pacifico',fontWeight: FontWeight.w500),),
          Text('${channel.description}'),
          homeVideo?
           AspectRatio(
            aspectRatio: 1.75,
            child: VideoPlayer(vpcontroller)
          )
          :SizedBox(),
          ListView.builder(
          itemCount: pinnedVideos.length,
          itemBuilder: (context,index){
            var video=pinnedVideos[index];
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