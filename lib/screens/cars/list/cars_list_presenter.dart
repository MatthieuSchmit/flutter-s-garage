/*
 * s_garage - screens.cars.list/cars_list_presenter
 *
 * by Matthieu S. at 10-01-21 16:36
 *
 */

import 'package:s_garage/data/json_ds.dart';
import 'package:s_garage/models/Car.dart';

abstract class CarListContract {
  void onGetAllCars(List<Car> cars);
}

class CarListPresenter {
  CarListContract _view;
  JsonDataSource json = new JsonDataSource();
  CarListPresenter(this._view);

  getAllCars() {
    json.getAllCars().then((cars) {
      _view.onGetAllCars(cars);
    });
  }

}
