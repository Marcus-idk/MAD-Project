import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customWidgets/normal_button.dart';
import 'login_screen.dart';
import 'main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegExp regExpForEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp regExpForPhone = RegExp(r"^\d{8}$");

  String _name;
  String _email;
  String _password;
  String _phoneNumber;

  Future<void> setStringList() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> list = json.decode(prefs.getString("listOfUsers"));
    list.add(_name + "," + _email + "," + _password + "," + _phoneNumber);
    prefs.setString("listOfUsers", json.encode(list));
  }

  final _formKey = GlobalKey<FormState>();
  String validateName(String s) {
    if (s.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String validateEmail(String s) {
    if (s.isEmpty) {
      return 'Email is required';
    } else if (!(s.contains("@") && s.contains("."))) {
      return 'Invalid Email!';
    }
    return null;
  }

  String validatePassword1(String s) {
    if (s.isEmpty) {
      return 'Password is required';
    } else if (s.length < 8) {
      return 'Password needs to be at least 8 characters';
    }
    return null;
  }

  String validatePassword2(String s) {
    if (s.isEmpty) {
      return 'Password Confirmation is required';
    } else if (s.length < 8) {
      return 'Password needs to be at least 8 characters';
    }
    return null;
  }

  String validatePhone(String s) {
    RegExp regExp = RegExp(r'[A-Za-z]');
    if (s.isEmpty) {
      return 'Phone Number is required';
    } else if (regExp.hasMatch(s)) {
      return 'Phone number can only contain numbers!';
    } else if (s.length < 8) {
      return 'Invalid Phone number';
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _showSnackBar(String text) {
    final snackBar = SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        width: 250);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TopBar('Sign Up'),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                        validator: validateName,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: validateEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: TextFormField(
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: validatePassword1,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _phoneNumber = value;
                          });
                        },
                        validator: validatePhone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                NormalButton(
                    () async => {
                          if (_formKey.currentState.validate())
                            {
                              _showSnackBar("Successfully signed up!"),
                              await setStringList(),
                              Future.delayed(Duration(milliseconds: 800), () {
                                Navigator.push(
                                  context,
                                  MyPageRouteBuilder(page: LoginScreen()),
                                );
                              }),
                            },
                        },
                    30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
