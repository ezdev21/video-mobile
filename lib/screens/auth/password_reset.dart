import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/services/auth.dart';
import 'package:video_mobile/services/dio.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  
  final emailController=TextEditingController();
  final confirmationCodeController=TextEditingController();
  final passwordController=TextEditingController();
  final passwordConfirmationController=TextEditingController();
  bool emailSent=false;
  String confirmationCode='';
  bool confirmed=false;

  void getConfirmationCode() async{
    var res=await dio.post('/password_confirm',data:{'email':emailController.text});
    confirmationCode=res.data;
  }
  
  

  void confirm() async{
    if(confirmationCode==confirmationCodeController.text){
       login();   
    }
    else{
       
    }    
  }
  void login(){
    Map creds={
      'email':emailController.text,
      'password':passwordController.text,
      'device_info':Provider.of<Auth>(context,listen:false).getDeviceInfo()
    };
    Provider.of<Auth>(context,listen:false).login(creds);
    Navigator.of(context).pop();
  } 

  @override
  void dispose() {
    emailController.dispose();
    confirmationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          if(!confirmed){
            children:[
            Text('Enter Confirmation Code',style:TextStyle(fontSize:25)),
            SizedBox(height: 10),
            !emailSent ?
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'jhondoe@gmail.com',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0xffdc143d)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            )
            :TextFormField(
              controller: confirmationCodeController,
              decoration: InputDecoration(
                labelText: 'code',
                hintText: '',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0xffdc143d)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            ),
            ]
          }
          else{
            children: [
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: '********',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0xffdc143d)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            ),
            SizedBox(height:30),
            TextFormField(
              controller: passwordConfirmationController,
              decoration: InputDecoration(
                labelText: 'password confirmation',
                hintText: '********',
                fillColor:Colors.white,
                filled:true,
                contentPadding: EdgeInsets.all(3),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                  borderRadius:BorderRadius.circular(5)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(width: 2,color: Color(0xffdc143d)),
                  borderRadius:BorderRadius.circular(5)
                ),
              ),
            ),
            ], 
          }
        ),
      ),
    );
  }
}