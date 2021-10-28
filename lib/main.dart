import 'package:agriman/templates/plant_data.dart';
import 'package:flutter/material.dart';
import 'package:agriman/home_page.dart';
import 'package:agriman/templates/user_info_page.dart';
import 'package:agriman/templates/weather_info.dart';
import 'package:agriman/templates/crops.dart';
import 'package:agriman/login_register/login.dart';
import 'package:agriman/login_register/registration.dart';

import 'login_register/personal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/register',
      routes: {
        '/': (context) => Home(),
        '/user_info': (context) => UserInfo(),
        '/weather': (context) => Weather(),
        '/crops': (context) => CropList(),
        '/crop_data': (context) => PlantData(),
        '/login': (context) => LoginPage(),
        '/register': (context) => Registration(),
        '/profile': (context) => Userprofile()
      },
    );
  }
}
