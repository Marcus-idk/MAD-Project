import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingScreen extends StatefulWidget {
  final int data;

  const RatingScreen({Key key, @required this.data}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _value = 1;
  TextEditingController bodyController = new TextEditingController();
  Future<void> submitForm() async {
    final Email send_email = Email(
      body: bodyController.text + " from: marcusgohkz@gmail.com",
      subject: "Feedback",
      recipients: ['marcusgohkz@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );
    await FlutterEmailSender.send(send_email);
  }

  String pic = '';
  String name = '';
  String price = '';
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    String ls = await getData(widget.data);
    setState(() {
      pic = getPic(ls);
      name = getName(ls);
      price = getPrice(ls);
    });
  }

  Future<String> getData(int i) async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> list = json.decode(prefs.getString("listOfFoods"));
    return list[i];
  }

  String getPic(String ls) {
    return ls.split("/")[0];
  }

  String getName(String ls) {
    return ls.split("/")[1];
  }

  String getPrice(String ls) {
    return ls.split("/")[2];
  }

  @override
  Widget build(BuildContext context) {
    showRating() {
      if (_value <= 3) {
        return Text(
          _value.round().toString(),
          style: TextStyle(fontSize: 30, color: Colors.red),
        );
      } else if (_value <= 7) {
        return Text(
          _value.round().toString(),
          style: TextStyle(fontSize: 30, color: Colors.yellow),
        );
      } else {
        return Text(
          _value.round().toString(),
          style: TextStyle(fontSize: 30, color: Colors.green),
        );
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TopBar('Rating'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('images/' + pic),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text(
                      'Rating of ' + name,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Slider(
                      min: 1.0,
                      max: 10.0,
                      divisions: 8,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.black12,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  showRating(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text(
                      'Feedback',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: bodyController,
                      minLines: 2,
                      maxLines: 5,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.purple), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 1,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          submitForm();
                        },
                        child: const Text('Submit Rating',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
