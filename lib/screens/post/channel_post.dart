import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/screens/post/post_show.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_mobile/services/post_service.dart';

class ChannelPost extends StatefulWidget {
  const ChannelPost({super.key});

  @override
  State<ChannelPost> createState() => _ChannelPostState();
}

class _ChannelPostState extends State<ChannelPost> {

  @override
  void initState() {
    Provider.of<PostService>(context).getChannelPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      itemCount: Provider.of<PostService>(context).posts.length,
      itemBuilder: (context,index){
        var post=Provider.of<PostService>(context).posts[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PostShow()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                post.image?
                Image.network(
                  width:MediaQuery.of(context).size.width/2,
                  '${post.image}'
                  //'https://media.istockphoto.com/id/1405163092/photo/3d-render-of-sport-running-shoe-isolated-on-pastel-background-3d-background-minimal-scene.jpg?s=612x612&w=is&k=20&c=55ZC86AZBWD60IbclH2UnKj-93DpR34dDVI9HXzCpFo='
                )
                :SizedBox(),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${post.title}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                    Text('${post.description}',style: TextStyle(fontSize: 16,color: Colors.grey[700])),
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