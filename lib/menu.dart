import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/customWidgets/smaller_food_display.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/Food.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String searchString = '';
  List<Food> listOfFoods = [];
  void initState() {
    super.initState();
  }

  Future<List<Food>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> list = json.decode(prefs.getString("listOfFoods"));
    int index = 0;
    List<Food> x = [];
    for (int i = 0; i < list.length; i++) {
      x.add(new Food(
          getPic(list[i]), getName(list[i]), getPrice(list[i]), index));
      index++;
    }
    return x;
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

  TextEditingController searchController = new TextEditingController();
  void filterInputs(String s) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TopBar('Menu'),
        Container(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  if (value == null || value == '') {
                    searchString = '';
                  } else {
                    searchString = searchController.text;
                  }
                });
              },
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
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/preferences');
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
          child: FutureBuilder<List<Food>>(
            future: getData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
              if (snapshot.hasData) {
                List<Food> list = snapshot.data
                    .where((element) => element
                        .getName()
                        .toLowerCase()
                        .contains(searchString.toLowerCase()))
                    .toList();
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 2.5 / 4,
                  children: list.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmallerFoodDisplay(item.getPic(), item.getPrice(),
                          item.getName(), item.getIndex()),
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
