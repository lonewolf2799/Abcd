import 'package:agriman/models/plant_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlantData extends StatefulWidget {
  late PlantModel _model;
  PlantData(PlantModel model, {Key? key}) : super(key: key) {
    _model = model;
  }

  @override
  _PlantDataState createState() => _PlantDataState(_model);
}

class _PlantDataState extends State<PlantData> {
  late PlantModel model;
  _PlantDataState(PlantModel model) {
    this.model = model;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
                tag: model,
                child: Transform.scale(
                    scale: 0.5, child: Image.asset(model.imageStr))),
            Card(
              elevation: 8,
              margin: const EdgeInsets.all(16.0),
              child: Text(model.id),
            )
          ],
        ),
      ),
    );
  }
}
