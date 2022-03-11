import 'dart:convert';

import 'package:agriman/models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../utils/constants.dart';

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
  String temp = "10";
  String hum = "10";
  bool fanMotorStatus = false;
  bool waterPumpStatus = false;

  @override
  void initState() {
    super.initState();
    readData();
    attachStatus('Fan');
    attachStatus('Motor');
    Timer timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      readData();
      //mytimer.cancel() //to terminate this timer
    });
  }

  Future<void> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://temhupr-default-rtdb.firebaseio.com/";
    var tempUrl = url + "temp.json";
    var humUrl = url + "humidity.json";

    try {
      final response = await http.get(Uri.parse(tempUrl));

      setState(() {
        temp = response.body;
      });
    } catch (error) {
      rethrow;
    }
    try {
      final response = await http.get(Uri.parse(humUrl));
      setState(() {
        hum = response.body;
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> attachStatus(String device) async {
    var url =
        "https://temhupr-default-rtdb.firebaseio.com/" + device + "/value.json";
    print(url);
    final response = await http.get(Uri.parse(url));
    setState(() {
      if (device == "Fan")
        fanMotorStatus = response.body == "true" ? true : false;
      else
        waterPumpStatus = response.body == "true" ? true : false;
    });
  }

  Future<void> toggleStatus(String device) async {
    var url = globalServerLink + device;
    var status = device == "Fan" ? fanMotorStatus : waterPumpStatus;

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{'value': status}),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
                tag: model,
                child: Transform.scale(
                    scale: 0.5, child: Image.asset(model.imageStr))),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(model.id),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                              trackWidth: 0.6,
                              progressBarWidth: 10,
                              shadowWidth: 10),
                          customColors: CustomSliderColors(
                              trackColor: HexColor('#ef6c00'),
                              progressBarColor: HexColor('#ffb74d'),
                              shadowColor: HexColor('#ffb74d'),
                              shadowMaxOpacity: 0.5, //);
                              shadowStep: 20),
                          infoProperties: InfoProperties(
                              bottomLabelStyle: TextStyle(
                                  color: HexColor('#6DA100'),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                              bottomLabelText: 'Temp.',
                              mainLabelStyle: TextStyle(
                                  color: HexColor('#54826D'),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                              modifier: (double value) {
                                return '${temp} ˚C';
                              }),
                          startAngle: 90,
                          angleRange: 360,
                          size: 128,
                          animationEnabled: true),
                      min: 0,
                      max: 100,
                      initialValue: double.parse(temp),
                    ),
                    FlutterSwitch(
                      width: 125.0,
                      height: 55.0,
                      valueFontSize: 25.0,
                      toggleSize: 45.0,
                      value: fanMotorStatus,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          fanMotorStatus = val;
                          print(fanMotorStatus);
                          toggleStatus('Fan');
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                          customWidths: CustomSliderWidths(
                              trackWidth: 0.6,
                              progressBarWidth: 10,
                              shadowWidth: 10),
                          customColors: CustomSliderColors(
                              trackColor: HexColor('#0277bd'),
                              progressBarColor: HexColor('#4FC3F7'),
                              shadowColor: HexColor('#B2EBF2'),
                              shadowMaxOpacity: 0.5, //);
                              shadowStep: 20),
                          infoProperties: InfoProperties(
                              bottomLabelStyle: TextStyle(
                                  color: HexColor('#6DA100'),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              bottomLabelText: 'Humidity.',
                              mainLabelStyle: TextStyle(
                                  color: HexColor('#54826D'),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600),
                              modifier: (double value) {
                                return '${hum} %';
                              }),
                          startAngle: 90,
                          angleRange: 360,
                          size: 128,
                          animationEnabled: true),
                      min: 0,
                      max: 100,
                      initialValue: double.parse(hum),
                    ),
                    FlutterSwitch(
                      width: 125.0,
                      height: 55.0,
                      valueFontSize: 25.0,
                      toggleSize: 45.0,
                      value: waterPumpStatus,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          waterPumpStatus = val;
                          toggleStatus('Motor');
                        });
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
