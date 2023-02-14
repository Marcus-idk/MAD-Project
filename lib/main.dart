import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/contact_us.dart';
import 'package:project/edit_profile.dart';
import 'package:project/home_screen.dart';
import 'package:project/intro_page.dart';
import 'package:project/login_screen.dart';
import 'package:project/order_history.dart';
import 'package:project/preferences.dart';
import 'package:project/progress_tracker.dart';
import 'package:project/rating_food.dart';
import 'package:project/signup_screen.dart';
import 'package:project/starter.dart';
import 'package:project/view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'about_us.dart';
import 'forgot_password.dart';
import 'menu.dart';
import 'menu_individual.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    helper();
  }

  Future<void> helper() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("listOfUsers", "[]");
    List<String> listOfFoods = [
      "salmon.jpg/Salmon Dish/\$12.00",
      "choccake.jpg/Chocolate Cake/\$9.50",
      "steak.jpg/Steak/\$16.00",
      "tomato.jpg/Tomato Dish/\$5.00",
      "pancake.jpg/Pancakes/\$7.80",
      "yellowcake.jpg/Yellow Cakes/\$8.50"
    ];
    await prefs.setString("listOfFoods", jsonEncode(listOfFoods));
  }

  var map = {
    '/': LoginScreen(),
    '/signup': SignUpScreen(),
    '/forgot': ForgotPasswordScreen(),
    '/home': Starter(),
    '/menuIndiv': MenuIndividualScreen(data: 0),
    '/rating': RatingScreen(data: 0),
    '/preferences': PreferencesScreen(),
    '/editProfile': EditProfileScreen(),
    '/orderHistory': OrderHistoryScreen(),
    '/viewProfile': ViewProfileScreen(),
    '/contactUs': ContactUsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      theme: ThemeData(
        fontFamily: 'Hind',
      ),
      home: IntroPage(),
      routes: {
        // '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/home': (context) => Starter(),
        '/menuIndiv': (context) => MenuIndividualScreen(data: 0),
        '/rating': (context) => RatingScreen(data: 0),
        '/preferences': (context) => PreferencesScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        '/orderHistory': (context) => OrderHistoryScreen(),
        '/viewProfile': (context) => ViewProfileScreen(),
        '/contactUs': (context) => ContactUsScreen(),
      },
      onGenerateRoute: (settings) {
        return MyPageRouteBuilder(page: map[settings.name]);
      },
    );
  }
}

class MyPageRouteBuilder extends PageRouteBuilder {
  final Widget page;

  MyPageRouteBuilder({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.0,
                  1.0,
                  curve: Curves.linear,
                ),
              ),
            ),
            child: child,
          ),
        );
}
