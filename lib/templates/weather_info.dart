import 'package:flutter/material.dart';

const fractionDigits = 2;

String toGoodTempString(double? temp) {
  if (temp == null) return "";
  temp -= 273;
  return temp.toStringAsFixed(fractionDigits);
}

class WeatherInfo {
  String? locName;
  String? description;

  int? humidity;
  int? pressure;
  int? visibility;
  int? windDeg;

  double? temperature;
  double? feelsLike;
  double? windSpeed;
  double? tempMax;
  double? tempMin;

  TimeOfDay? sunRise;
  TimeOfDay? sunSet;

  WeatherInfo(Map<String, dynamic> json) {
    final int sr = json['sys']['sunrise'] as int;
    final int ss = json['sys']['sunset'] as int;
    final DateTime srise = DateTime.fromMillisecondsSinceEpoch(sr * 1000);
    final DateTime sset = DateTime.fromMillisecondsSinceEpoch(ss * 1000);

    this.locName = json['name'];
    this.sunRise = TimeOfDay.fromDateTime(srise);
    this.sunSet = TimeOfDay.fromDateTime(sset);
    this.description = json['weather'][0]['description'];
    this.feelsLike = json['main']['feels_like'];
    this.visibility = json['visibility'];
    this.pressure = json['main']['pressure'];
    this.tempMax = json['main']['temp_max'];
    this.tempMin = json['main']['temp_min'];
    this.temperature = json['main']['temp'];
    this.humidity = json['main']['humidity'];
    this.windSpeed = json['wind']['speed'];
    this.windDeg = json['wind']['deg'];
  }
//   return 'Student: {name: ${name}, age: ${age}}';
  @override
  String toString() {
    return 'WeatherInfo : {temp : ${toGoodTempString(this.temperature)} , sunrise: ${this.sunRise} , sunset: ${this.sunSet} , hum: ${this.humidity} , w_sp: ${this.windSpeed} , w_deg : ${this.windDeg} }';
  }
}
