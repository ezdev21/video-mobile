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
          TextFormField(
           decoration:textInputDecoration.copyWith(labelText:'channel name',hintText:'channnel name'),
           validator:(val)=>val.length>2? 'channel name should be maximium of 3 characters' : null,
           controller:_channelController.text,
           onChanged:(){
             
           }
          )
        )
      )
    );
  }
}