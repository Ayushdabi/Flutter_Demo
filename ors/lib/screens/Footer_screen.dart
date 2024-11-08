import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '© ${DateTime.now().year} RAYS Technologies. All rights reserved.',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigate to Privacy Policy screen
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.yellow, fontSize: 14),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '|',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  // Navigate to Terms of Service screen
                },
                child: Text(
                  'Terms of Service',
                  style: TextStyle(color: Colors.yellow, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
