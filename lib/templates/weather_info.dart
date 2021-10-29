import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/weather_info.dart';
import '../utils/constants.dart';

Future<WeatherInfo> getWeather(String city) async {
  final queryParameters = {'q': city, 'appid': api_key};
  final uri = Uri.https(w_link, '/data/2.5/weather', queryParameters);
  late WeatherInfo info;
  await get(uri).then((value) => info = WeatherInfo(jsonDecode(value.body)));

  return info;
}

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherInfo? wInfo;
  String s = "";

  void handleWeatherTap() {
    getWeather("Mumbai").then((value) => wInfo = value).then((v) {
      setState(() {
        s = wInfo.toString();
      });
    });
  }

  @override
  void initState() {
    handleWeatherTap();
    super.initState();
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
          Text(s)
        ],
      ),
    );
  }
}
