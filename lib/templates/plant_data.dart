import 'package:agriman/models/plant_model.dart';
import 'package:flutter/material.dart';

class PlantData extends StatefulWidget {
  @override
  State<PlantData> createState() => _PlantDataState();
}

class _PlantDataState extends State<PlantData> {
  late PlantModel data;
  Map<String, PlantModel> m = {};
  @override
  Widget build(BuildContext context) {
    m = ModalRoute.of(context)!.settings.arguments as Map<String, PlantModel>;
    data = m['data'] as PlantModel;
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(children: [
            Text('${data.name}'),
            Text('${data.id}'),
            Text('${data.realTimeStatus.humidity}'),
            Text('${data.realTimeStatus.currTemp}'),
          ]),
        ));
  }
}
