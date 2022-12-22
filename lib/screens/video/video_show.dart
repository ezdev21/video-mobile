import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/models/user.dart';
import 'package:video_mobile/screens/auth/login.dart';
import 'package:video_mobile/screens/auth/register.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoShow extends StatefulWidget {
  const VideoShow({super.key});

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  dynamic video;
  late VideoPlayerController vpcontroller;
  late Channel channel;
  late User user;
  bool authenticated=false;
  bool looping=false;
  bool liked=false;
  bool disliked=false;
  bool subscribed=false;

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
  
  Future openDialog(String type){
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
        title: type=='subscribe'?
        Text('want to subscribe this channel?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
        :Text('want to $type this video?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        content: type=='subscribe'? 
        Text('sign in to subscribe this channel')
        :Text('sign in to make your opinion count.'),
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login())); 
            },
            child: Text('sign in',style: TextStyle(color:Color(0xffdc143d)),)
          ),
          MaterialButton(
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register())); 
            },
            color: Color(0xffdc143d),
            child: Text('sign up',style: TextStyle(color:Colors.white),)
          ), 
        ],
      ))
    );
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
  
  void subscribe() async{
    if(authenticated){
      try{
        //var res=await dio().post('/channel/${channel.id}/subscribe',data:{'userId':user.id,'channelId':channel.id});
        subscribed=!subscribed;
      }catch(e){
        print(e);
      }
    }
    else{
      openDialog('subscribe');
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
          children: [
            AspectRatio(
              aspectRatio: 1.75,
              child: VideoPlayer(vpcontroller)
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('the great escape full movie',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height:10),
                Row(
                  children: [
                  // channel.url?
                  // CircleAvatar(
                  //   radius: 50,
                  //   backgroundImage: NetworkImage('${channel.url}'),
                  // )
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xffdc143d),
                    child: Center(
                      child: Text('ET',style: TextStyle(color: Colors.white,fontSize: 20),),
                    )
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ezra Tube',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                      Text('0 subscribers')
                    ],
                  ),
                  SizedBox(width: 100,),
                  MaterialButton(
                    onPressed: (){
                      subscribe();
                    },
                    height: 45,
                    color: subscribed? Colors.grey[700] : Color(0xffdc143d),
                    textColor: Colors.white,
                    child: Text('Subscribe',style: TextStyle(fontSize: 18),),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text('the great escape full movie',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
              Row(children: [
                IconButton(
                  color: liked? Color(0xffdc143d) :Colors.grey[600],
                  onPressed: (){
                    if(authenticated){
                      setState(() {
                      if(disliked){
                        disliked=false;
                      }
                      liked=!liked;
                      });
                      likeVideo();
                    }
                    else{
                      openDialog('like');
                    }
                  },
                  icon: Icon(Icons.thumb_up)
                ),
                Text('0'),
                SizedBox(width: 20,),
                IconButton(
                  color: disliked? Color(0xffdc143d) :Colors.grey[600],
                  onPressed: (){
                    if(authenticated){
                      setState(() {
                      if(liked){
                        liked=false;
                      }
                      disliked=!disliked;
                      dislikeVideo();
                    });
                    }
                    else{
                      openDialog('dislike');
                    }
                  },
                  icon: Icon(Icons.thumb_down)
                ),
                Text('0'),
                ],
              )   
              ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
