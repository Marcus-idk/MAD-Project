import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/customWidgets/top_bar.dart';
import 'package:project/rating_food.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MenuIndividualScreen extends StatefulWidget {
  final int data;

  const MenuIndividualScreen({Key key, @required this.data}) : super(key: key);

  @override
  _MenuIndividualScreenState createState() => _MenuIndividualScreenState();
}

class _MenuIndividualScreenState extends State<MenuIndividualScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
          TopBar('Menu'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset('images/' + pic),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: FittedBox(
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              child: Text(
                                price,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.purple,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              _showSnackBar("Added to favourites");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Container(
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
                          textStyle: const TextStyle(fontSize: 25),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MyPageRouteBuilder(
                                page: RatingScreen(data: widget.data)),
                          );
                        },
                        child: const Text('Rate the food!',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: Container(
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
                          textStyle: const TextStyle(fontSize: 25),
                        ),
                        onPressed: () {},
                        child: const Text('Order Now!',
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
