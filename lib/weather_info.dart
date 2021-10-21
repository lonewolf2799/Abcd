import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:weather/weather.dart';
import 'package:http/http.dart';
import './templates/weather_info.dart';
import './constants.dart';

Future<WeatherInfo> getWeather(String city) async {
  // THis is the api call
  // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  final queryParameters = {'q': city, 'appid': api_key};
  final uri = Uri.https(w_link, '/data/2.5/weather', queryParameters);

  final response = await get(uri);

  WeatherInfo info = WeatherInfo(jsonDecode(response.body));
  return info;
}

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherInfo? wInfo;

  void handleWeatherTap() {
    setState(() {
      getWeather("Mumbai").then((value) => wInfo = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: handleWeatherTap,
            icon: Icon(Icons.wb_sunny),
            label: Text('getWeather'),
          ),
          Text(wInfo != null ? wInfo.toString() : "")
        ],
      ),
    );
  }
}
