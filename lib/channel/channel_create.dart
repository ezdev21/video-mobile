import "package:flutter/material.dart";

class ChannelCreate extends StatefulWidget {
  ChannelCreate({Key? key}) : super(key: key);

  @override
  _ChannelCreateState createState() => _ChannelCreateState();
}

class _ChannelCreateState extends State<ChannelCreate> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Form(
        key:_formKey,
        child:Column(
          Text('channel name',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
          SizedBox(height:20),
          TextFormField(
           decoration:textInputDecoration.copyWith(labelText:'channel name',hintText:'name'),
           validator:(val)=>val.length>2? 'channel name should be maximium of 3 characters' : null,
           controller:_nameController.text,
           onChanged:(){
             
           }
          ),
          SizedBox(height:20),
          Text('channel description',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),
          SizedBox(height:20),
          TextFormField(
           decoration:textInputDecoration.copyWith(labelText:'channel description',hintText:'desciption'),
           validator:(val)=>val.length>2? 'channel name should be maximium of 3 characters' : null,
           controller:_descriptionController.text,
           onChanged:(){
             
           }
          ),
        )
      )
    );
  }
}