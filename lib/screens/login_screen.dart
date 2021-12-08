import 'package:flutter/material.dart';
import 'package:flutter_application_6/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _emailController.text = 'kcummings@example.net';
    _passwordController.text = 'password';
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) => value!.isEmpty ? "Ingrese algo válido" :null
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) => value!.isEmpty ? "Ingrese algo válido" :null
              ),
              SizedBox(height: 10,),
              FlatButton(
                minWidth: double.infinity,
                color: Colors.blue,
                child: Text("LogIn", style: TextStyle(color: Colors.white),),
                onPressed: (){
                  Map creds = {
                    "email": _emailController.text,
                    "password": _passwordController.text,
                    "devicename": "mobile",
                  };
                  if(_formkey.currentState!.validate()){
                    // ignore: avoid_print
                    Provider.of<Auth>(context, listen: false).login(creds);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}