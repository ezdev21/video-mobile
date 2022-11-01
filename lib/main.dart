import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:video_mobile/screens/video/search_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Sharing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'video sharing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final searchController=TextEditingController();
  List<dynamic> videos=[];
  Future<void> getvideos() async{
    var res=await http.get(Uri.parse('http://127.0.0.1:8000/videos'));
    videos=jsonDecode(res.body);
  } 

  @override
  void initState() {
    getvideos();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdc143d),
        title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText:'search',
              fillColor:Colors.white,
              filled: true,
              hintText: 'search videos,channels...'
            ),
          ),
        centerTitle: true,
        actions:[
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchController.text})));
            },
            icon:Icon(Icons.search)
          ),
        ]
      ),
      body: videos.length==0 ?
      const Center(
        child: SpinKitFadingCube(
          size:140,
          color: Color(0Xff43db80)
        )
      )
      :ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context,index){
          return Container(
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
          );
        },
      )
    );
  }
}
