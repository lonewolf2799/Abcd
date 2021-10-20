import 'package:flutter/material.dart';

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
                  onPressed: () {},
                  icon: Icon(Icons.wb_sunny),
                  label: Text('Weather')),
            ],
          )),
    );
  }
}
