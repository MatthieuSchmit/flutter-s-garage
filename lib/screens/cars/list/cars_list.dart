/*
 * s_garage - screens.cars.list/cars_list
 *
 * by Matthieu S. at 10-01-21 17:20
 *
 */

import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/models/Car.dart';
import 'package:s_garage/screens/cars/list/cars_list_presenter.dart';

class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}
class _CarListState extends State<CarList> implements CarListContract {

  List<Car> _cars;
  CarListPresenter _presenter;

  _CarListState() {
    _presenter = new CarListPresenter(this);
    _presenter.getAllCars();
  }

  @override
  Widget build(BuildContext context) {
    if (_cars == null) return Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
      ),
      backgroundColor: kBgColor,
      body: GridView.builder(
        itemCount: _cars.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_cars[index].images[0]),
                fit: BoxFit.fitWidth,
              )
            ),
            alignment: Alignment.center,
            child: Text(
              "${_cars[index].mark} ${_cars[index].model}"
            ),
          );
        },
      ),
    );
  }

  List<Widget> _body() {
    List<Widget> list = [];
    _cars.forEach((element) {
      list.add(Container(
        child: Text("${element.mark} ${element.model}"),
      ));
    });
    return list;
  }

  @override
  void onGetAllCars(List<Car> cars) {
    setState(() {
      _cars = cars;
    });
  }

}
