import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';


class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final _loginText = "Login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Form(
          key: _formLoginKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String? data) =>(data!.isEmpty) ? null : 'Problem' ,
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (String? data) =>(data!.isEmpty ) ? null : 'Problem' ,
              ),
              ElevatedButton(onPressed: () {
                if(_formLoginKey.currentState?.validate() ?? false){};
              }, child: Text(_loginText))
            ],
          )),
    );

  }
  
}


