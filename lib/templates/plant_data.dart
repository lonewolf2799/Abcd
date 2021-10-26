import 'package:agriman/models/plant_model.dart';
import 'package:flutter/material.dart';

class PlantData extends StatefulWidget {
  @override
  State<PlantData> createState() => _PlantDataState();
}

Widget buildCard(PlantModel model) => Card(
    shadowColor: Colors.red,
    clipBehavior: Clip.antiAlias,
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    child: Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(16),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          Text(
            model.id,
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          Container(
            padding: EdgeInsets.all(11),
            child: Text(model.realTimeStatus.humidity.toString()),
          )
        ],
      ),
    ));

class _PlantDataState extends State<PlantData> {
  late PlantModel data;
  Map<String, PlantModel> m = {};
  @override
  Widget build(BuildContext context) {
    m = ModalRoute.of(context)!.settings.arguments as Map<String, PlantModel>;
    data = m['data'] as PlantModel;
    return Scaffold(appBar: AppBar(), body: buildCard(data));
  }
}
