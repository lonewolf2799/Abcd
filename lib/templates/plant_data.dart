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
  String temp = "0";
  String hum = "0";
  String moisture = "10";
  bool fanMotorStatus = false;
  bool waterPumpStatus = false;

  @override
  void initState() {
    super.initState();
    readDataFromFirebase();
    attachStatus('Fan');
    attachStatus('Motor');
    Timer _ = Timer.periodic(const Duration(seconds: 5), (timer) {
      readDataFromFirebase();
    });
  }

  Future<void> updateVarsFromFirebase(String url, int which) async {
    try {
      final response = await http.get(Uri.parse(url));

      setState(() {
        String respBody = response.body;
        which == 0
            ? temp = respBody
            : (which == 1 ? hum = respBody : moisture = respBody);
        if (double.parse(respBody) < 0)
          which == 0 ? temp = "0" : (which == 1 ? hum = "0" : moisture = "0");
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<void> readDataFromFirebase() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://temhupr-default-rtdb.firebaseio.com/";
    var tempUrl = url + "temp.json";
    var humUrl = url + "humidity.json";
    var mosUrl = url + "moisture.json";

    updateVarsFromFirebase(tempUrl, 0);
    updateVarsFromFirebase(humUrl, 1);
    updateVarsFromFirebase(mosUrl, 2);
  }

  Future<void> attachStatus(String device) async {
    var url =
        "https://temhupr-default-rtdb.firebaseio.com/" + device + "/value.json";
    final response = await http.get(Uri.parse(url));
    setState(() {
      if (device == "Fan")
        fanMotorStatus = response.body == "true" ? false : true;
      else
        waterPumpStatus = response.body == "true" ? false : true;
    });
  }

  Future<void> toggleStatus(String device) async {
    var url = globalServerLink + device;
    var status = device == "Fan" ? fanMotorStatus : waterPumpStatus;

    final _ = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{'value': !status}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: ListView(children: [
        Center(
          child: Column(
            children: [
              Hero(
                  tag: model,
                  child: Transform.scale(
                      scale: 0.5, child: Image.asset(model.imageStr))),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                                    fontSize: 20,
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
                                trackColor: HexColor('#00cc00'),
                                progressBarColor: HexColor('#00ff99'),
                                shadowColor: HexColor('#00b359'),
                                shadowMaxOpacity: 0.5, //);
                                shadowStep: 20),
                            infoProperties: InfoProperties(
                                bottomLabelStyle: TextStyle(
                                    color: HexColor('#6DA100'),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                                bottomLabelText: 'Moisture',
                                mainLabelStyle: TextStyle(
                                    color: HexColor('#54826D'),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600),
                                modifier: (double value) {
                                  return '${moisture} %';
                                }),
                            startAngle: 90,
                            angleRange: 360,
                            size: 128,
                            animationEnabled: true),
                        min: 0,
                        max: 100,
                        initialValue: double.parse(moisture),
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
                  SizedBox(height: 28),
                  Center(
                      child: SleekCircularSlider(
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
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            bottomLabelText: 'Humidity',
                            mainLabelStyle: TextStyle(
                                color: HexColor('#54826D'),
                                fontSize: 20,
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
                  ))
                ],
              )
            ],
          ),
        ),
      ]),
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

List<List<String>> clr = [
  ['#0277bd', '#4FC3F7']
];

Color getColorBasedOnList(int l_idx, int c_idx) {
  return HexColor(clr[l_idx][c_idx]);
}
