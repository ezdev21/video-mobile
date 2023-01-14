import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/provider/video/video_show_provider.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class VideoShow extends StatefulWidget {
  const VideoShow({super.key});

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  
  @override
  void initState() {
    super.initState();
    playVideo();
  }
  void playVideo({int index=0,bool init=false}){
    Provider.of<VideoShowProvider>(context,listen:false).vpcontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..setLooping(Provider.of<VideoShowProvider>(context,listen:false).looping)
      ..initialize().then((_) {
        Provider.of<VideoShowProvider>(context,listen:false).vpcontroller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    Provider.of<VideoShowProvider>(context,listen: false).vpcontroller.dispose();
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    Provider.of<VideoShowProvider>(context,listen: false).video=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(), 
      body: Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.75,
              child: VideoPlayer(Provider.of<VideoShowProvider>(context,listen: false).vpcontroller)
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
                      Provider.of<VideoShowProvider>(context,listen: false).subscribe();
                    },
                    height: 45,
                    color: Provider.of<VideoShowProvider>(context,listen: false).subscribed? Colors.grey[700] : Color(0xffdc143d),
                    textColor: Colors.white,
                    child: Text('Subscribe',style: TextStyle(fontSize: 18),),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text('the great escape full movie',style: TextStyle(fontSize: 16,color: Colors.grey[700]),),
              Row(children: [
                IconButton(
                  color: Provider.of<VideoShowProvider>(context,listen: false).liked? Color(0xffdc143d) :Colors.grey[600],
                  onPressed: (){
                    if(Provider.of<VideoShowProvider>(context,listen: false).authenticated){
                      setState(() {
                      if(Provider.of<VideoShowProvider>(context,listen: false).disliked){
                        Provider.of<VideoShowProvider>(context,listen: false).disliked=false;
                      }
                      Provider.of<VideoShowProvider>(context,listen: false).liked=!Provider.of<VideoShowProvider>(context,listen: false).liked;
                      });
                      Provider.of<VideoShowProvider>(context,listen: false).likeVideo();
                    }
                    else{
                      Provider.of<VideoShowProvider>(context,listen: false).openDialog('like',context);
                    }
                  },
                  icon: Icon(Icons.thumb_up)
                ),
                Text('0'),
                SizedBox(width: 20,),
                IconButton(
                  color: Provider.of<VideoShowProvider>(context,listen: false).disliked? Color(0xffdc143d) :Colors.grey[600],
                  onPressed: (){
                    if(Provider.of<VideoShowProvider>(context,listen: false).authenticated){
                      setState(() {
                      if(Provider.of<VideoShowProvider>(context,listen: false).liked){
                        Provider.of<VideoShowProvider>(context,listen: false).liked=false;
                      }
                      Provider.of<VideoShowProvider>(context,listen: false).disliked=!Provider.of<VideoShowProvider>(context,listen: false).disliked;
                      Provider.of<VideoShowProvider>(context,listen: false).dislikeVideo();
                    });
                    }
                    else{
                      Provider.of<VideoShowProvider>(context,listen: false).openDialog('dislike',context);
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
