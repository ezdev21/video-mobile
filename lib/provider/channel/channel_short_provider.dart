import 'package:flutter/material.dart';
import 'package:video_mobile/models/channel.dart';
import 'package:video_mobile/services/dio.dart';

class ChannelShortProvider extends ChangeNotifier{
  dynamic videos=[];
  late Channel channel;

  Future getChannelShorts() async{
    Response res=await dio().get('/channel/${channel.id}/videos');
    videos=res.data;
  }
}