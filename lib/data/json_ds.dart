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

  Future<List<Car>> getSecondHands({int nb = 0}) {
    return rootBundle.loadString("assets/second_hand.json").then((jsonString) {
      List<Car> cars = [];
      Map<String,dynamic> jsonResponse = jsonDecode(jsonString);
      jsonResponse.forEach((key, map) {
        if (nb == 0) {
          cars.add(new Car(map));
        } else if (cars.length < nb) {
          cars.add(new Car(map));
        } else {
          // break;
        }
      });
      return cars;
    });
  }

  Future<List<Car>> getNewCars({int nb = 0}) {
    return rootBundle.loadString("assets/new_car.json").then((jsonString) {
      List<Car> cars = [];
      Map<String,dynamic> jsonResponse = jsonDecode(jsonString);
      jsonResponse.forEach((key, map) {
        if (nb == 0) {
          cars.add(new Car(map));
        } else if (cars.length < nb) {
          cars.add(new Car(map));
        } else {
          // break;
        }
      });
      return cars;
    });
  }

}
