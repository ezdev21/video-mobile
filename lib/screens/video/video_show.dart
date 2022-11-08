import 'package:flutter/material.dart';
import 'package:video_mobile/services/dio.dart';

class VideoShow extends StatefulWidget {
  const VideoShow({super.key});

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  //final video=ModalRoute.of(context).settings.arguments;
  bool like=false;
  bool dislike=false;
  
  void likevideo() async{
    //dio().post('/video/${video.id}/like',data: {'userId':'${user.id}','videoId':'${video.id}','type':'like'});
    like=!like;
    if(dislike){
      dislike=false;
    }
  }
  
  void dislikevideo() async{
    //dio().post('/video/${video.id}/like',data: {'userId':'${user.id}','videoId':'${video.id}','type':'dislike'});
    dislike=!dislike;
    if(like){
      like=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Image.network('${video.image}'),
          SizedBox(height: 10),
          //Text('${video.title}'),
          //Text('${video.description}'),
          Row(children: [
            IconButton(
              onPressed: (){
               likevideo();
              },
              icon: Icon(Icons.thumb_up)
            ),
            //Text('${video.totalLikes}'),
            SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                dislikevideo();
              },
              icon: Icon(Icons.thumb_down)
            ),
            //Text('${video.totalDislikes}'),
          ],)
        ],
      ),
    );
  }
}