import 'package:video_mobile/services/dio.dart'; 
import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';

class ChannelCommunityProvider extends ChangeNotifier{
  dynamic channels;
  late Channel channel;

  Future fetchChannels() async{
    Response res=await dio().get('/channel/${channel.id}/featured-channels');
    channels=res.data;
    notifyListeners();
  }

  List<Channel> getChannels(){
    return channels;
  }
}