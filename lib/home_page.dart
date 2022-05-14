import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'models/weather_info.dart';
import 'utils/constants.dart';
// import './templates/user_info_page.dart';

Future<WeatherInfo> getWeather(String city) async {
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
          Option_cards(
            link:
                "https://www.sailthru.com/content/uploads/2018/06/iStock-463540505-e1541622181340.jpg",
            title: "Profile",
            route: "profile",
          )
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
