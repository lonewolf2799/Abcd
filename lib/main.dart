import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/user_info_page.dart';
import 'package:untitled/weather_api.dart';
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
            '/weather':(context)=> Weather(),
          },
        );
      }
    }


