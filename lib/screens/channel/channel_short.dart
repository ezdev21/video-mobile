import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/provider/channel/channel_short_provider.dart';
import 'package:video_mobile/screens/video/video_show.dart';

class ChannelShort extends StatefulWidget {
  const ChannelShort({super.key});

  @override
  State<ChannelShort> createState() => _ChannelShortState();
}

class _ChannelShortState extends State<ChannelShort> {
  
  @override
  void initState() {
    super.initState();
    Provider.of<ChannelShortProvider>(context,listen: false).getChannelShorts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      itemCount: Provider.of<ChannelShortProvider>(context,listen: false).videos.length,
      itemBuilder: (context,index){
        var video=Provider.of<ChannelShortProvider>(context,listen: false).videos[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoShow()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Image.network(
                  width:MediaQuery.of(context).size.width/2,
                  '${video.image}'
                ),
                SizedBox(width: 5,),
                Column(
                  children: [
                    Text('${video.title}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                    Text('${video.description}',style: TextStyle(fontSize: 16,color: Colors.grey[700])),
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