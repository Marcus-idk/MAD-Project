import 'package:flutter/material.dart';
import 'package:project/customWidgets/bottom_navbar.dart';
import 'package:project/customWidgets/top_bar.dart';

import 'customWidgets/normal_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _value = 0;
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
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavbar(),
      appBar: AppBar(
        title: const Text('Rating'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TopBar('Rating'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('images/salmon.jpg'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text(
                      'Rating of food',
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
                        onPressed: () {},
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
