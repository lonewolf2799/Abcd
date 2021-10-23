import 'package:flutter/material.dart';
import 'package:agriman/home_page.dart';
import 'package:agriman/user_info_page.dart';
import 'package:agriman/weather_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/weather',
      routes: {
        '/': (context) => Home(),
        '/user_info': (context) => UserInfo(),
        '/weather': (context) => Weather(),
      },
    );
  }
}
