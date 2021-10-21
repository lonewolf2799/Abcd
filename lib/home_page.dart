import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'templates/weather_info.dart';
import 'constants.dart';

void getWeather(String city, Widget wg) async {
  // THis is the api call
  // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  final queryParameters = {'q': city, 'appid': api_key};
  final uri = Uri.https(w_link, '/data/2.5/weather', queryParameters);

  final response = await get(uri);

  WeatherInfo info = new WeatherInfo(jsonDecode(response.body));
  print(info.toString());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Agriculture-home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          ElevatedButton.icon(
              onPressed: () {}, icon: Icon(Icons.person), label: Text('User')),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              //Text('Here we will be adding our widgets for main screen '),
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
                    getWeather("Mumbai", this);
                  },
                  icon: Icon(Icons.wb_sunny),
                  label: Text('Weather')),
            ],
          )),
    );
  }
}
