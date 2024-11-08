// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';
import 'header_screen.dart'; // Import Header class
import 'Footer_screen.dart'; // Import Header class

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Adjust header height if needed
        child: Header(),
      ),
      body: Center( // Center the body content
        child: Text(
          'Welcome to the Online Result System!',
          style: TextStyle(fontSize: 50, color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: Footer(), // Footer at the bottom of the screen
    );
  }
}
