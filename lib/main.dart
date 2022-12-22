import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/screens/home_page.dart';
import 'package:video_mobile/services/auth_service.dart';
import 'package:video_mobile/services/post_service.dart';
import 'package:video_mobile/services/video_create_service.dart';
import 'package:video_mobile/services/video_show_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>AuthService()),
        ChangeNotifierProvider(create: (context)=>VideoCreateService()),
        ChangeNotifierProvider(create: (context)=>VideoShowService()),
        ChangeNotifierProvider(create: (context)=>PostService()),
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