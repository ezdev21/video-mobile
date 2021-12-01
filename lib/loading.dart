import "package:video-mobile/material.dart";
import "package:video-mobile/models/video.dart";
import "package:video-mobile/videos.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:http/http.dart";
import "dart:convert";

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  List<Video> videos=[];
  bool error=false;
  void getVideos() async{
   try{
    Response response=await get('http://127.0.0.1/videos_injsonFormat');
    dynamic videos=jsonDecode(response.body);
    Naviator.push((context),MateriaPageRoute(builder:(context)=>Videos()),arguments:{videos:videos});
   }
   catch(e){
     error=true;
   }
  }

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.crimson[500],
      body:child:(error)
      ? Center(
        Text("sorry! unable to fetch data",style:TextStyle(fontSize:30,color:Colors.white))
      )
      : Center(
        child:SpinKitFadingCube(
          color:Colors.white,
          size:80.0
        )
      )
    );
  }
}