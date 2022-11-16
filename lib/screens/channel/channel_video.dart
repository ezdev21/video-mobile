import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/screens/video/video_show.dart';
import 'package:video_mobile/services/dio.dart';

class ChannelVideo extends StatefulWidget {
  const ChannelVideo({super.key});

  @override
  State<ChannelVideo> createState() => _ChannelVideoState();
}

class _ChannelVideoState extends State<ChannelVideo> {
  dynamic videos=[];
  late Channel channel;
  @override
  void initState() {
    getChannelVideos();
    super.initState();
  }
  
  Future getChannelVideos() async{
    Response res=await dio().get('/channel/${channel.id}/viedos');
    videos=res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context,index){
        var video=videos[index];
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
      )
    ); 
  }
}