import 'package:flutter/material.dart';
import 'customWidgets/normal_button.dart';
import 'customWidgets/top_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar('Welcome Back'),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextField(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                NormalButton(() => Navigator.pushNamed(context, '/home'), 30),
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
