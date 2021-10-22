import 'dart:math';

import 'package:untitled/models/palnt_status.dart';

const int factsLen = 10;

class PlantModel {
  String? id;
  String? name;
  List<String>? facts;
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

  PlantModel(String id, String name) {
    this.id = id;
    this.name = name;
  }

  // facts update once a day or we'll decide
  void factsUpdate(List<String> nFacts) {
    // just keep 10 facts in total
    List<String> nList = List.empty();
    for (int i = 0; i < min(factsLen, nFacts.length); ++i) nList.add(nFacts[i]);
    if (nList.length == factsLen) {
      facts?.clear();
      facts = nList;
      return;
    }
    // keep the last first facts and make total factsLen or the loop ends early
    for (String s in facts!) {
      if (nList.length == factsLen) return;
      nList.add(s);
    }

    facts!.clear();
    facts = nList;
  }
}
