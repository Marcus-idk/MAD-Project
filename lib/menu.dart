import 'package:flutter/material.dart';
import 'package:project/customWidgets/smaller_food_display.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'customWidgets/bottom_navbar.dart';
import 'customWidgets/food_display.dart';
import 'customWidgets/normal_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(),
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TopBar('Menu'),
          Container(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search, color: Colors.black),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Preferences >',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.white,
                side: BorderSide(width: 2, color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmallerFoodDisplay(
                            'salmon.jpg', '12.00', 'Salmon Dish'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmallerFoodDisplay(
                            'salmon.jpg', '12.00', 'Salmon Dish'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmallerFoodDisplay(
                            'salmon.jpg', '12.00', 'Salmon Dish'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmallerFoodDisplay(
                            'salmon.jpg', '12.00', 'Salmon Dish'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
