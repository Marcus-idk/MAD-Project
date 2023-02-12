import 'package:flutter/material.dart';
import 'package:project/about_us.dart';
import 'package:project/home_screen.dart';
import 'package:project/menu.dart';
import 'package:project/progress_tracker.dart';
import 'package:project/view_profile.dart';

class Starter extends StatefulWidget {
  const Starter({Key key}) : super(key: key);

  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  int _selectedIndex = 4;
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
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
      body: widgets[_selectedIndex],
    );
  }
}
