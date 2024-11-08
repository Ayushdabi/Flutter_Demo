import 'package:flutter/material.dart';
import 'package:ors/services/api_service.dart';
import 'package:ors/screens/login_screen.dart'; // Import the login screen

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final ApiService _apiService = ApiService();
  String _userName = 'Guest'; // Default to Guest when not logged in

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black, // Background color for the header
      width: double.infinity, // Make it stretch across the screen
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute items
        children: [
          Icon(
            Icons.home, // Example icon, you can change it
            color: Colors.white,
            size: 30,
          ),
          Text(
            'App Header', // Header title
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [

              SizedBox(width: 10),
              // If the user is logged in, show their name with a dropdown
              if (_userName != 'Guest') ...[
                // Display user's name
                GestureDetector(
                  onTap: () {
                    _showLogoutDropdown(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        _userName,
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ]
              // If no user is logged in, show 'Guest'
              else ...[
                Text(
                  'Guest',
                  style: TextStyle(color: Colors.white),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }

  // Show the logout dropdown when the user clicks on their name
  void _showLogoutDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await _apiService.logout();
                setState(() {
                  _userName = 'Guest'; // Reset to 'Guest' on logout
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
