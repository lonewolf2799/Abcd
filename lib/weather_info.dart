import 'package:flutter/material.dart';
//import 'package:weather/weather.dart';
import 'package:http/http.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  void getWeather(String city) async {
    // THis is the api call
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '5cd9f6c1f2e8ba4b09280370e8cd3d4d'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await get(uri);
    print('Now we get the weather api uri');
    print(response.body);
  }

  void initState() {
    super.initState();
    getWeather('Mumbai');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(' You will see weather report here '),
      ),
    );
  }
}
