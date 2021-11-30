import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key:_formKey,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
           TextFormField(
            controller: _emailController,
            validator: (value)=>value.isEmpty()? 'email required':'',
           ),
           TextFormField(
            controller: _passwordController,
            validator: (value)=>value.isEmpty()? 'password required':'',
           ),
           sizedBox(height:20),
           TextButton(
             onPressed: (){
              Map creds={
                'email':_emailController.text,
                'password':_passwordController.text,
                'device_name':'mobile'
              };
              if(_formKey.currentState.validate()){

              }
             },
             child: Text(
               'login',
               style:TextStyle(
                fontSize:20,
                color:Colors.white,
                backgroundColor:Colors.red
               )
              ),
           ) 
          ],
          )
        ),
    );
  }
}