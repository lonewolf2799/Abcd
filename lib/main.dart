import 'package:flutter/material.dart';

void main() => runApp(MyApp());

    class MyApp extends StatelessWidget {
      const MyApp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Home(),
        );
      }
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

          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(' Here we will be building our app now '),
          ),
        );
      }
    }


