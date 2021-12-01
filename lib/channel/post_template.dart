import 'package:flutter/material.dart';
import 'package:video-mobile/models/post.dart';

class PostTemplate extends StatefulWidget {
  Post post;
  PostTemplate({Key? key,this.post}) : super(key: key);

  @override
  _PostTemplateState createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children:[
          Text('${post.title}',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
          SizedBox(height:10),
          Image(
            image:NetwokImage('${post.imageUrl}')
          )
          Text('${post.body}',style:TextStyle(fontSize:20)),
          SizedBox(height:10),
          Row(
           children:[
            IconButton(
              onPressed:(){
               try{
                 Response response=await post('http://127.0.0.1:8000/video/like',{user:,post:});
                 liked=true;
               },
               catch(e){
                 error=true;
               }
              },
              icon:Icon(Icons.thumb_up),
              color:like? Colors.crimson : Colors.grey[100],
              size:30
            ),
            Text('${post.likes}',style:TextStyle(fontSize:25)),
            SizedBox(width:30)
            IconButton(
              onPressed:(){
               try{
                 Response response=await post('http://127.0.0.1:8000/video/dislike',{user:,post:});
                 liked=true;
               },
               catch(e){
                 error=true;
               }
              },
              icon:Icon(Icons.thumb_down),
              color:dislike? Colors.crimson : Colors.grey[100],
              size:30
            ),
            Text('${post.dislikes}',style:TextStyle(fontSize:25)), 
           ] 
          )
        ]
      )
    );
  }
}