import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/buy_sell.dart';
import 'package:flutter_app/app_screens/registration.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String url = 'http://10.0.2.2:9998/api/User/ValidateUser';

  Future signIn(String email, pass) async {
    var jsonResponse = null;
    var response = await http.get(url + "/" + email + "/" + pass);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => RegistrationPage()), (Route<dynamic> route) => false);
      }
    }
    else {
      print(response.body);
    }
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email Address"),
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red[900],
                  textColor: Colors.white,
                  child: Text("Login"),
                  onPressed: () => signIn(emailController.text, passwordController.text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


