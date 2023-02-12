import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customWidgets/normal_button.dart';
import 'customWidgets/top_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMsg = '';
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future<bool> checkIfUserExists() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> list = json.decode(prefs.getString("listOfUsers"));
    for (int i = 0; i < list.length; i++) {
      List<dynamic> ls = list[i].split(",");
      if (emailController.text == ls[1] && passwordController.text == ls[2]) {
        await prefs.setString('name', ls[0]);
        await prefs.setString('email', ls[1]);
        await prefs.setString('password', ls[2]);
        await prefs.setString('number', ls[3]);
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar('Welcome Back'),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Your Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.blue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Your Password',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.blue),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                if (errorMsg != "")
                  Text(
                    'Invalid Login!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                NormalButton(
                    () async => {
                          if (await checkIfUserExists())
                            {Navigator.pushNamed(context, '/home')}
                          else
                            setState(() {
                              errorMsg = "Invalid Log in";
                            }),
                        },
                    30),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                FlatButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot');
                  },
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 3, color: Colors.blueAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
