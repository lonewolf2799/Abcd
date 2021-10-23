import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';
import 'package:untitled/templates/user_info_page.dart';
import 'package:untitled/templates/weather_info.dart';
import 'package:untitled/templates/crops.dart';
void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          initialRoute: '/crops',
          routes: {
            '/': (context) => Home(),
            '/user_info': (context) => UserInfo(),
            '/weather':(context)=> Weather(),
            '/crops':(context)=> CropList(),
          },
        );
      }
    }


