import 'package:video_mobile/screens/home_page.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/services/auth_service.dart';
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
    var res=await dio().post('/password_confirm',data:{'email':emailController.text});
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
      'device_info':Provider.of<AuthService>(context,listen:false).getDeviceInfo()
    };
    Provider.of<AuthService>(context,listen:false).login(creds);
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
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          child: Center(
            child: !confirmed?
            Container(
              child: !emailSent?
              Column(
                children: [
                  Text('reset your password here',style: TextStyle(color: Colors.grey[600],fontSize: 23,fontFamily: 'Pacifico'),),
                  Text('Enter Your Email',style:TextStyle(fontSize:20)),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Text('back to home',style: TextStyle(color:Color(0xffdc143d)),),
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                    ),
                  ),
                  SizedBox(height: 10),
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
                ],
              )
              :Column(
                children: [
                  Text('Enter Confirmation Code send to ${emailController.text}',style:TextStyle(fontSize:20)),
                  SizedBox(height: 10),
                  TextFormField(
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
                ],
              )
            ) 
            :Column(
              children: [
              Text('Enter a new password',style: TextStyle(fontSize: 18),),
              SizedBox(height:10),  
              TextFormField(
                controller: passwordController,
                obscureText:true,
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
              SizedBox(height:10),
              Text('confirm a new password',style: TextStyle(fontSize: 18),),
              SizedBox(height:10), 
              TextFormField(
                controller: passwordConfirmationController,
                obscureText:true,
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
            ),
          ),
        ),
      ),
    );
  }
}