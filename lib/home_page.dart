import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'models/weather_info.dart';
import 'utils/constants.dart';

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
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
        title: Text('Main Menu'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Option_cards(
            route: "crops",
            title: 'Crops',
            link:
                "https://images.pexels.com/photos/185402/vegetables-fresh-tomatoes-fresh-vegetables-185402.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
          ),
          Option_cards(
              link:
                  "https://images.pexels.com/photos/5245865/pexels-photo-5245865.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              title: "Weather",
              route: "weather"),
          Option_cards(
              link:
                  "https://images.pexels.com/photos/2749165/pexels-photo-2749165.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
              title: 'Greenhouse account',
              route: "user_info"),
          // Option_cards(link: link, title: title, route: route)
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Option_cards extends StatelessWidget {
  String link;
  String title;
  String route;
  Option_cards({required this.link, required this.title, this.route = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Ink.image(
            image: NetworkImage(link),
            fit: BoxFit.cover,
            height: 200,
            child: InkWell(
              onTap: () {
                if (route.isNotEmpty) {
                  Navigator.pushNamed(context, '/$route');
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white),
            ),
          ),
        ]));
  }
}

/*
class Home extends StatefulWidget {
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CropList();
                    }));
                  },
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
class Abcd extends StatelessWidget {
  const Abcd({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
*/