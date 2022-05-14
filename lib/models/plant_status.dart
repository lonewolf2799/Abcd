class PlantStatus {
  int? moisture;
  int? humidity;
  DateTime? lastWatered;
  DateTime? installed;
  double? currTemp;

  PlantStatus() {
    moisture = humidity = 20;
    currTemp = 23;
    lastWatered = installed = DateTime.now();
  }
}
