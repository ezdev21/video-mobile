import 'package:flutter/material.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class VideoShow extends StatefulWidget {
  const VideoShow({super.key});

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  dynamic video;
  late VideoPlayerController vpcontroller;
  bool looping=true;
  bool liked=false;
  bool disliked=false;
  
  @override
  void initState() {
    playVideo();
    super.initState();
  }
  
  @override
  void dispose() {
    vpcontroller.dispose();
    super.dispose();
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

  void likeVideo() async{
    //dio().post('/video/${video.id}/like',data: {'userId':'${user.id}','videoId':'${video.id}','type':'like'});
    liked=!liked;
    if(disliked){
      disliked=false;
    }
  }
  
  void dislikeVideo() async{
    //dio().post('/video/${video.id}/like',data: {'userId':'${user.id}','videoId':'${video.id}','type':'dislike'});
    disliked=!disliked;
    if(liked){
      liked=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    video=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(), 
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.75,
              child: VideoPlayer(vpcontroller)
            ),
            Text('the great escape full movie',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            Text('the great escape full movie',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
            Row(children: [
              IconButton(
                color: liked? Color(0xffdc143d) :Colors.grey[600],
                onPressed: (){
                  setState(() {
                    if(disliked){
                      disliked=false;
                    }
                    liked=!liked;
                  });
                 //likeVideo();
                },
                icon: Icon(Icons.thumb_up)
              ),
              Text('0'),
              SizedBox(width: 20,),
              IconButton(
                color: disliked? Color(0xffdc143d) :Colors.grey[600],
                onPressed: (){
                  setState(() {
                    if(liked){
                      liked=false;
                    }
                    disliked=!disliked;
                  });
                  //dislikeVideo();
                },
                icon: Icon(Icons.thumb_down)
              ),
              Text('0'),
            ],)
          ],
        ),
      ),
    );
  }
}