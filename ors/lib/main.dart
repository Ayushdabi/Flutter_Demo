// lib/main.dart
import 'package:flutter/material.dart';
import 'package:ors/screens/login_screen.dart';
import 'package:ors/screens/signup_screen.dart';
import 'package:ors/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ORS',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}