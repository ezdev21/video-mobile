import 'package:flutter/material.dart';

class AboutChannel extends StatefulWidget {
  const AboutChannel({ Key? key }) : super(key: key);

  @override
  _AboutChannelState createState() => _AboutChannelState();
}

class _AboutChannelState extends State<AboutChannel> {
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