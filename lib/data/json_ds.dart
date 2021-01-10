/*
 * s_garage - data/json_ds
 *
 * by Matthieu S. at 10-01-21 16:40
 *
 */

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:s_garage/models/Car.dart';

class JsonDataSource {

  Future<List<Car>> getAllCars() {
    return rootBundle.loadString("assets/cars.json").then((jsonString) {
      List<Car> cars = [];
      Map<String,dynamic> jsonResponse = jsonDecode(jsonString);
      jsonResponse.forEach((key, map) {
        cars.add(new Car(map));
      });
      return cars;
    });
  }

}
