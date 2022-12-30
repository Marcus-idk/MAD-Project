import 'package:flutter/material.dart';
import 'package:project/customWidgets/multi_select.dart';
import 'package:project/customWidgets/smaller_food_display.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'customWidgets/bottom_navbar.dart';
import 'customWidgets/food_display.dart';
import 'customWidgets/normal_button.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({Key key}) : super(key: key);

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  double _startValue = 1;
  double _endValue = 60;
  double _rating = 1;
  showRating() {
    if (_rating <= 3) {
      return Text(
        _rating.round().toString(),
        style: TextStyle(fontSize: 30, color: Colors.red),
      );
    } else if (_rating <= 7) {
      return Text(
        _rating.round().toString(),
        style: TextStyle(fontSize: 30, color: Colors.yellow),
      );
    } else {
      return Text(
        _rating.round().toString(),
        style: TextStyle(fontSize: 30, color: Colors.green),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
      ),
      bottomNavigationBar: BottomNavbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar('Preferences'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cuisine',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  MultiSelect('Chinese', 'Italian', 'French', 'Indian'),
                  MultiSelect('Greek', 'Spanish', 'Japanese', 'Thai'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text('Price Range', style: TextStyle(fontSize: 20)),
                  ),
                  RangeSlider(
                    min: 1.0,
                    max: 60.0,
                    values: RangeValues(_startValue, _endValue),
                    onChanged: (values) {
                      setState(() {
                        _startValue = values.start;
                        _endValue = values.end;
                      });
                    },
                  ),
                  Text(
                    _startValue.round().toString() +
                        ' - ' +
                        _endValue.round().toString(),
                    style: TextStyle(fontSize: 30, color: Colors.purple),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child:
                        Text('Minimum Rating', style: TextStyle(fontSize: 20)),
                  ),
                  Slider(
                    min: 1.0,
                    max: 10.0,
                    divisions: 8,
                    activeColor: Colors.purple,
                    inactiveColor: Colors.black12,
                    value: _rating,
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                  showRating(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Container(
                      width: 170,
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
                        child: const Text('Confirm Preferences',
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
