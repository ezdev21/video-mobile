import 'package:flutter/material.dart';

class Channel extends StatefulWidget {
  const Channel({ Key? key }) : super(key: key);

  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
           children:[
            CircleAvatar(
            backgroundImage:NetworkImage(''),
            radius: 30,
          ),
          Column(
            children: [
              Text(
                channel.name,
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )),
              Text(
                '${channel.suscribers} subscribers',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )
                )
            ],
          ), 
           ]
          ),
          FloatingActionButton(
            onPressed:(){

            },
            child:Text(channel.subscribed? 'subscribe':'subscribed',
            style:TextStyle(
              color:channel.subscribed? Colors.grey[300] : Colors.white,
              backgroundColor: channel.subscribed? Colors.red : Colors.grey[600]
              )
            )
            )
        ],
      ),
    );
  }
}