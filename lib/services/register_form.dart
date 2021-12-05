import "package:flutter/material.dart";
import 'package:email_validator/email_validator.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

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
    return Scaffold(
      body:Form(
       key:_formKey,
       autovalidate:true,
       child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
         children:[
           TextFormField(
            controller:_emailController,
            validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
            decoration:TextFieldDecoration(

            )
           ),
           SizedBox(height:20),
           TextFormField(
            controller:_emailController,
            validator:(val)=>val.isEmpty ? 'please enter a valid email' :null,
            decoration:TextFieldDecoration(

            )
           ),
           SizedBox(height:20),
           TextButton(
            Map creds={
             'email' : _emailController.text,
             'password' : _passwordController.text,
             'device_name': 'android'
            };
            onPressed:(){
             if(_formKey.currenState.validate()){

             }
            },
            child:Text(
              'Login',
              style:TextStyle(fontSize:20,color:Colors.white)
            ),
            color:Colors.crimson[500]
           ),
         ]
       )
       )
      )
    );
  }
}