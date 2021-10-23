import 'package:flutter/material.dart';
import '../models/plant_model.dart';

/// Adding the template UI for each entity at level 1

class PlantDetail extends StatefulWidget {
  const PlantDetail({Key? key}) : super(key: key);
  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  PlantModel plantModel = PlantModel("", "");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Data'),
      ),
    );
  }
}
