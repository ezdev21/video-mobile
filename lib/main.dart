import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchQuery:searchController.text})));
            },
            icon:Icon(Icons.search)
          ),
        ]
      ),
      body: Center(
        child: SpinKitFadingCube(
          size:120,
          color: Color(0xffdc143c)
        )
      ),
    );
  }
}
