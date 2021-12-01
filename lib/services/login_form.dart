import "package:flutter/material.dart";

class LoinForm extends StatefulWidget {
  LoinForm({Key? key}) : super(key: key);

  @override
  _LoinFormState createState() => _LoinFormState();
}

class _LoinFormState extends State<LoinForm> {

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
       child:Column(

       )
      )
    );
  }
}