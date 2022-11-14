import 'package:flutter/material.dart';

  PreferredSizeWidget CustomAppBar() {
    final searchController=TextEditingController();
    return AppBar(
        backgroundColor: Color(0xffdc143d),
        title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText:'search videos channels...',
              fillColor:Colors.white,
              filled: true,
              hintText: 'search videos channels...'
            ),
          ),
        centerTitle: true,
        actions:[
          IconButton(
            onPressed: (){
              //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchPage(),settings:RouteSettings(arguments:{searchController.text})));
            },
            icon:Icon(Icons.search)
          ),
        ]
      );
  }