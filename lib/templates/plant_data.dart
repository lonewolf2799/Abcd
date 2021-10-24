import 'package:flutter/material.dart';

class PlantData extends StatelessWidget {
Map data  = {};


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('${data['name']}'),
      )
    );
  }
}
