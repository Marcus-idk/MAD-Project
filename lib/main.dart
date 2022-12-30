import 'package:flutter/material.dart';
import 'package:project/edit_profile.dart';
import 'package:project/home_screen.dart';
import 'package:project/login_screen.dart';
import 'package:project/order_history.dart';
import 'package:project/preferences.dart';
import 'package:project/progress_tracker.dart';
import 'package:project/rating_food.dart';
import 'package:project/signup_screen.dart';
import 'package:project/view_profile.dart';
import 'about_us.dart';
import 'forgot_password.dart';
import 'menu.dart';
import 'menu_individual.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: 'Hind',
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/signup': (context) => SignUpScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutUsScreen(),
        '/menu': (context) => MenuScreen(),
        '/menuIndiv': (context) => MenuIndividualScreen(),
        '/rating': (context) => RatingScreen(),
        '/preferences': (context) => PreferencesScreen(),
        '/progress': (context) => ProgressTrackerScreen(),
        '/viewProfile': (context) => ViewProfileScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        '/orderHistory': (context) => OrderHistorySreen(),
      },
    );
  }
}
