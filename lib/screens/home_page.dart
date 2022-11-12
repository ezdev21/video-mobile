import 'package:video_mobile/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:video_mobile/screens/video/search_page.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/screens/video/video_show.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = new FlutterSecureStorage();
  final searchController=TextEditingController();
  List<dynamic> videos=[];

  @override
  void initState() {
    readToken();
    getvideos();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  
   Future<void> getvideos() async{
    var res=await Dio().get('/videos');
    videos=jsonDecode(res.data);
  } 

  void readToken() async{
    String? token=await storage.read(key: 'token');
    Provider.of<Auth>(context,listen: false).tryToken(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:AppDrawer(),
      appBar: CustomAppBar(),
      body: videos.length==0 ?
      Padding(
        padding:EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to Video Sharing',style: TextStyle(color: Colors.grey[600], fontSize: 30, fontFamily: 'Pacifico'),),
            SizedBox(height: 50,),
            SpinKitFadingCube(
              size:140,
              color: Color(0xffdc143d)
            ),
          ],
        ),
      )
      :ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              var video=videos[index];
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>VideoShow(),settings:RouteSettings(arguments:{video})));
            },
            child: Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https://cdn.pixabay.com/photo/2022/09/26/23/26/african-american-7481724_960_720.jpg'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('video title',style:TextStyle(fontSize:17,fontWeight: FontWeight.w600)),
                      Text('video.description',style:TextStyle(fontSize:15,color: Colors.grey[600]))
                    ]
                  )
                ]
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(5)
              ), 
            ),
          );
        },
      )
    );
  }
}
