import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/services/dio.dart';
import 'package:video_player/video_player.dart';

class ChannelHomeProvider extends ChangeNotifier{
  bool homeVideo=true;
  late VideoPlayerController vpcontroller;
  bool looping=true;
  bool liked=false;
  bool disliked=false;
  dynamic pinnedVideos=[];
  late Channel channel;
  
  Future getChannelVideos() async{
    Response res=await dio().get('/channel/${channel.id}/viedos');
    pinnedVideos=res.data;
  }

}