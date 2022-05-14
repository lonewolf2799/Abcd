import 'dart:math';

import './plant_status.dart';

const int factsLen = 10;

class PlantModel {
  late String id;
  late String name;
  late List<String> facts;
  late String imageStr; // for image
  PlantStatus realTimeStatus = PlantStatus();

  void attachCompleteStatus(PlantStatus nStatus) {
    this.realTimeStatus = nStatus;
  }

  void waterStatusUpdate(DateTime? now) {
    if (now != null) this.realTimeStatus.lastWatered = now;
  }

  void updateTemperature(double temperature) {
    this.realTimeStatus.currTemp = temperature;
  }

  PlantModel(String id, String name, bool imageGiven) {
    this.id = id;
    this.name = name;
    this.imageStr = imageGiven ? 'assets/vegetables/${name.toLowerCase()}.jpg' : 'assets/vegetables/fallback.jpg';
    this.facts = [];
  }

  // facts update once a day or we'll decide
  void factsUpdate(List<String> nFacts) {
    // just keep 10 facts in total
    List<String> nList = List.empty();
    for (int i = 0; i < min(factsLen, nFacts.length); ++i) nList.add(nFacts[i]);
    if (nList.length == factsLen) {
      facts.clear();
      facts = nList;
      return;
    }
    // keep the last first facts and make total factsLen or the loop ends early
    for (String s in facts) {
      if (nList.length == factsLen) return;
      nList.add(s);
    }

    facts.clear();
    facts = nList;
  }

  // was trying to serialize the class no need rn
  Map toJSON() {
    Map data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['facts'] = [];

    for (String fact in this.facts) {
      data['facts'].add(fact);
    }

    data['imageStr'] = this.imageStr;

    Map realTimeStats = {};
    realTimeStats['moisture'] = this.realTimeStatus.moisture;
    realTimeStats['humidity'] = this.realTimeStatus.humidity;
    realTimeStats['lastWatered'] = this.realTimeStatus.lastWatered;
    realTimeStats['installed'] = this.realTimeStatus.installed;

    data['realtimeStats'] = realTimeStats;

    return data;
  }
}
