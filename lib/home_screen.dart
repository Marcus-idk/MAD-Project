import 'package:flutter/material.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'customWidgets/food_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TopBar('Home'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Text(
                    'Top Choices of the Day',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FoodDisplay('salmon.jpg', '\$12.00', 'Salmon Dish', 0),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FoodDisplay('steak.jpg', '\$16.00', 'Steak Dish', 2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
