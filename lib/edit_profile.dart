import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  void initState() {
    super.initState();
    helper();
  }

  final _formKey = GlobalKey<FormState>();
  String validateName(String s) {
    if (s.isEmpty) {
      return "Name cannot be empty!";
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

  String validatePhone(String s) {
    RegExp regExp = RegExp(r'[A-Za-z]');
    if (s.isEmpty) {
      return 'Phone Number is required';
    } else if (regExp.hasMatch(s)) {
      return 'Phone number can only contain numbers!';
    } else if (s.length < 8) {
      return 'Invalid Phone number';
    }
    return null;
  }

  Future<void> helper() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name');
      emailController.text = prefs.getString('email');
      numberController.text = prefs.getString('number');
    });
  }

  Future<void> writeData() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> list = json.decode(prefs.getString("listOfUsers"));
    int index = -1;
    for (int i = 0; i < list.length; i++) {
      List<dynamic> ls = list[i].split(",");
      if (prefs.getString("name") == ls[0] &&
          prefs.getString("email") == ls[1] &&
          prefs.getString("number") == ls[3]) {
        index = i;
      }
    }
    list[index] = nameController.text +
        "," +
        emailController.text +
        "," +
        list[index].split(",")[2] +
        "," +
        numberController.text;
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('number', numberController.text);
    prefs.setString("listOfUsers", json.encode(list));
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar('Edit Profile'),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 10, 70, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 150,
                            child: TextFormField(
                              controller: nameController,
                              validator: validateName,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left:
                                    BorderSide(width: 1, color: Colors.purple),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Joined\n',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: '0 ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'mon ago',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: emailController,
                        validator: validateEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: TextFormField(
                        controller: numberController,
                        validator: validatePhone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        if (_formKey.currentState.validate())
                          {
                            writeData(),
                            _showSnackBar("Successfully changed profile!"),
                            Future.delayed(Duration(milliseconds: 800), () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            }),
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.purple.withOpacity(0.3),
                              radius: 35,
                              child: Icon(
                                Icons.arrow_back,
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Text(
                                'Save & Go back',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
