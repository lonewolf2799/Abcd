import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'User Account',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0.0,
      ),
    );
  }
}
