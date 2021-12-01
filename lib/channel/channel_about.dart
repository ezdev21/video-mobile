import 'package:flutter/material.dart';

class ChannelAbout extends StatefulWidget {
  ChannelAbout({Key? key}) : super(key: key);

  @override
  _ChannelAboutState createState() => _ChannelAboutState();
}

class _ChannelAboutState extends State<ChannelAbout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:[
          Text('${channel.name}',style:TextStyle(fontSize:25)),
          SizedBox(height:20),
          Text('${channel.subscribers} subscribers',style:TextStyle(fontSize:25)),
          SizedBox(height:20),
          Text('Description',style:TextStyle(fontSize:25)),
          SizedBox(height:20),
          Text('${channel.description}',style:TextStyle(fontSize:25)),
        ]
      )
    );
  }
}