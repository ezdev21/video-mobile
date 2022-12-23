import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/screens/home_page.dart';
import 'package:video_mobile/provider/auth_provider.dart';
import 'package:video_mobile/provider/post_provider.dart';
import 'package:video_mobile/provider/video_create_provider.dart';
import 'package:video_mobile/provider/video_show_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>VideoCreateProvider()),
        ChangeNotifierProvider(create: (context)=>VideoShowProvider()),
        ChangeNotifierProvider(create: (context)=>PostProvider()),
      ],
      child: const MyApp()
    )
  );
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
      home: const HomePage(),
    );
  }
}