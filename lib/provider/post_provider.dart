import 'package:video_mobile/services/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/models/post.dart';

class PostProvider extends ChangeNotifier{
  dynamic posts=[];
  late Channel channel;
  late Post post;

  Future getChannelPosts() async{
    Response res=await dio().get('/channel/${channel.id}/viedos');
    posts=res.data;
    notifyListeners();
  }

  Future getPost() async{
    Response res=await dio().get('/channel/${channel.id}/post/${post.id}');
    post=res.data;
    notifyListeners();
  }

}