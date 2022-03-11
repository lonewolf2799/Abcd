import 'package:flutter/material.dart';
import 'package:agriman/home_page.dart';
import 'package:agriman/templates/weather_info.dart';
import 'package:agriman/templates/crops.dart';
import 'package:agriman/templates/user_info_page.dart';
import 'package:agriman/auth/login.dart';
import 'package:agriman/auth/registration.dart';
import 'package:agriman/auth/personal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/weather': (context) => Weather(),
        '/crops': (context) => CropList(),
        '/login': (context) => LoginPage(),
        '/register': (context) => Registration(),
        '/profile': (context) => Userprofile(),
        '/user_info': (context) => UserInfo()
      },
    );
  }
}
