import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_mobile/screens/auth/login.dart';
import 'package:video_mobile/services/auth_service.dart';
import 'package:video_mobile/widgets/app_drawer.dart';
import 'package:video_mobile/widgets/custom_app_bar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final formKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final passwordConfirmationController=TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:30,horizontal:5),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text('Register to Video Sharing',style: TextStyle(color: Colors.grey[600],fontSize: 23,fontFamily: 'Pacifico'),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account?'),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Text('sign in',style: TextStyle(color: Color(0xffdc143d)),),
                        onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                        }
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'name',
                    hintText: 'jhon doe',
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
                SizedBox(height: 30),
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
                ),
                SizedBox(height:30),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
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
                  obscureText: true,
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
                SizedBox(height: 30),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: Color(0xffdc143d),
                  textColor: Colors.white,
                  onPressed: (){
                    Map creds={
                      'name':nameController.text,
                      'email':emailController.text,
                      'password':passwordController.text,
                      'password_confirmation':passwordConfirmationController.text
                    };
                    Provider.of<AuthService>(context,listen:false).register(creds);
                    Provider.of<AuthService>(context,listen:false).login({'email':emailController.text,'password':passwordController.text});
                    Navigator.of(context).pop();
                  },
                  child: Text('Register',style: TextStyle(fontSize: 18),),
                )
              ], 
            )
          ),
        ),
      ),
    );
  }
}