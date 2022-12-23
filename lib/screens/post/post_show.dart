import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/models/post.dart';
import 'package:video_mobile/provider/post_provider.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class PostShow extends StatefulWidget {
  const PostShow({super.key});

  @override
  State<PostShow> createState() => _PostShowState();
}

class _PostShowState extends State<PostShow> {
  
  @override
  void initState() {
    Provider.of<PostProvider>(context).getPost();
    super.initState();
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
            Provider.of<PostProvider>(context).post.url!.isNotEmpty?
            AspectRatio(
              aspectRatio: 1.75,
              child: Image.network('${Provider.of<PostProvider>(context).post.url}'),
            )
            :SizedBox(),
            Text('${Provider.of<PostProvider>(context).post.title}',style: TextStyle(fontSize: 20),),
            Provider.of<PostProvider>(context).post.description!.isNotEmpty?
            Text('${Provider.of<PostProvider>(context).post.description}')
            :SizedBox(),
            //comments
          ],
        ),
      )
    );
  }
}