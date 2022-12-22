import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/services/video_show_service.dart';
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
  
  @override
  void initState() {
    Provider.of<VideoShowService>(context,listen: false).playVideo();
    super.initState();
  }
  
  @override
  void dispose() {
    Provider.of<VideoShowService>(context,listen: false).vpcontroller.dispose();
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    Provider.of<VideoShowService>(context,listen: false).video=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(), 
      body: Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.75,
              child: VideoPlayer(Provider.of<VideoShowService>(context,listen: false).vpcontroller)
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
                      Provider.of<VideoShowService>(context,listen: false).subscribe();
                    },
                    height: 45,
                    color: Provider.of<VideoShowService>(context,listen: false).subscribed? Colors.grey[700] : Color(0xffdc143d),
                    textColor: Colors.white,
                    child: Text('Subscribe',style: TextStyle(fontSize: 18),),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text('the great escape full movie',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
              Row(children: [
                IconButton(
                  color: Provider.of<VideoShowService>(context,listen: false).liked? Color(0xffdc143d) :Colors.grey[600],
                  onPressed: (){
                    if(Provider.of<VideoShowService>(context,listen: false).authenticated){
                      setState(() {
                      if(Provider.of<VideoShowService>(context,listen: false).disliked){
                        Provider.of<VideoShowService>(context,listen: false).disliked=false;
                      }
                      Provider.of<VideoShowService>(context,listen: false).liked=!Provider.of<VideoShowService>(context,listen: false).liked;
                      });
                      Provider.of<VideoShowService>(context,listen: false).likeVideo();
                    }
                    else{
                      Provider.of<VideoShowService>(context,listen: false).openDialog('like',context);
                    }
                  },
                  icon: Icon(Icons.thumb_up)
                ),
                Text('0'),
                SizedBox(width: 20,),
                IconButton(
                  color: Provider.of<VideoShowService>(context,listen: false).disliked? Color(0xffdc143d) :Colors.grey[600],
                  onPressed: (){
                    if(Provider.of<VideoShowService>(context,listen: false).authenticated){
                      setState(() {
                      if(Provider.of<VideoShowService>(context,listen: false).liked){
                        Provider.of<VideoShowService>(context,listen: false).liked=false;
                      }
                      Provider.of<VideoShowService>(context,listen: false).disliked=!Provider.of<VideoShowService>(context,listen: false).disliked;
                      Provider.of<VideoShowService>(context,listen: false).dislikeVideo();
                    });
                    }
                    else{
                      Provider.of<VideoShowService>(context,listen: false).openDialog('dislike',context);
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
