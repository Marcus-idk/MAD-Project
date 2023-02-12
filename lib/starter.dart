import 'package:flutter/material.dart';
import 'package:project/about_us.dart';
import 'package:project/home_screen.dart';
import 'package:project/menu.dart';
import 'package:project/progress_tracker.dart';
import 'package:project/view_profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Starter extends StatefulWidget {
  const Starter({Key key}) : super(key: key);

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> pages = [
    '/home',
    '/about',
    '/viewProfile',
    '/progress',
    '/menu'
  ];

  List<String> pageTitles = [
    'Home',
    'About Us',
    'View Profile',
    'Progress Tracker',
    'Menu'
  ];

  List<Widget> widgets = [
    HomeScreen(),
    AboutUsScreen(),
    ViewProfileScreen(),
    ProgressTrackerScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.purple,
        onTap: _onItemTapped,
        height: 50,
        items: const <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.info,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ],
        index: _selectedIndex,
        buttonBackgroundColor: Colors.purple,
      ),
      body: widgets[_selectedIndex],
    );
  }
}
