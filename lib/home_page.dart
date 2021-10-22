import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'models/weather_info.dart';
import './weather_info.dart';
import 'constants.dart';

Future<WeatherInfo> getWeather(String city) async {
  // THis is the api call
  // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  final queryParameters = {'q': city, 'appid': api_key};
  final uri = Uri.https(w_link, '/data/2.5/weather', queryParameters);

  final response = await get(uri);

  WeatherInfo info = WeatherInfo(jsonDecode(response.body));
  return info;
}

class Home extends StatefulWidget {

import 'package:untitled/user_info_page.dart';
import 'package:untitled/weather_api.dart';
class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Agriculture-home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [


          ElevatedButton.icon(onPressed: (){
            Navigator.pushNamed(context, '/user_info');

          }, icon: Icon(Icons.person), label: Text('User')),


        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [

              Row(children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.agriculture),
                  label: Text('Crops'),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.book_rounded),
                    label: Text('Logs')),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Weather();
                    }));
                  },
                  icon: Icon(Icons.wb_sunny),
                  label: Text('Weather'),
                ),
              ]),

          


            ],
          )),
    );
  }
}
