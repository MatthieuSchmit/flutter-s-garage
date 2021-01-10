/*
 * s_garage - models/Car
 *
 * by Matthieu S. at 10-01-21 16:44
 *
 */

class Car {
  String mark;
  String model;
  int seat;
  double price;
  double km;
  String date;
  String transmission;
  int gears;
  double power; // kW
  double horsepower; // cv
  String fuel;
  List<String> images;

  Car(Map map) {
    this.mark = map['mark'];
    this.model = map["model"];
    this.seat = map["seat"] ?? 1;
    this.price = map["price"] ?? 0.0;
    this.km = map["km"] ?? 0.0;
    this.date = map["date"] ?? "";
    this.transmission = map["transmission"] ?? "";
    this.gears = map["gears"] ?? 1;
    this.power = map["power"] * 1.0 ?? 0.0;
    this.horsepower = map["horsepower"] * 1.0 ?? 0.0;
    this.fuel = map["fuel"] ?? "";
    this.images = [];
    (map["images"] as List<dynamic>).forEach((element) {
      this.images.add(element);
    });
  }

}
