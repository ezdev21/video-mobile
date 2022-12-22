import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/models/user.dart';
import 'package:video_mobile/screens/auth/login.dart';
import 'package:video_mobile/screens/auth/register.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_player/video_player.dart';

class VideoShowService extends ChangeNotifier{
  
  dynamic video;
  late VideoPlayerController vpcontroller;
  late Channel channel;
  late User user;
  bool authenticated=false;
  bool looping=false;
  bool liked=false;
  bool disliked=false;
  bool subscribed=false;

  void playVideo({int index=0,bool init=false}){
    vpcontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..setLooping(looping)
      ..initialize().then((_) {
        vpcontroller.play();
        setState(() {});
      });
  }
  
  Future openDialog(String type,context){
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
      openDialog('subscribe',context);
    }
  }
}