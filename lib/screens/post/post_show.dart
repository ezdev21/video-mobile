import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/models/post.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class PostShow extends StatefulWidget {
  const PostShow({super.key});

  @override
  State<PostShow> createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {
  late Channel channel;
  late Post post;
  @override
  void initState() {
    getPost();
    super.initState();
  }

  Future getPost() async{
    Response res=await dio().get('/channel/${channel.id}/post/${post.id}');
    post=res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(), 
      body: Container(
        child: Column(
          children: [
            post.url!.isNotEmpty?
            AspectRatio(
              aspectRatio: 1.75,
              child: Image.network('${post.url}'),
            )
            :SizedBox(),
            Text('${post.title}',style: TextStyle(fontSize: 20),),
            post.description!.isNotEmpty?
            Text('${post.description}')
            :SizedBox(),
            //comments
          ],
        ),
      )
    );
  }
}