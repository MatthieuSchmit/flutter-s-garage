
import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/data/json_ds.dart';
import 'package:s_garage/models/Car.dart';
import 'package:s_garage/screens/cars/info.dart';
import 'package:s_garage/screens/widgets/second_hand_list_tile.dart';

class ListOld extends StatefulWidget {
  @override
  _ListOld createState() => _ListOld();
}

class _ListOld extends State<ListOld> {

  List<Car> _cars;
  JsonDataSource _json;

  _ListOld() {
    _json = new JsonDataSource();
    _updateCarList();
  }

  _updateCarList() {
    _json.getSecondHands().then((cars) {
      setState(() {
        _cars = cars;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cars == null) return Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Voitures d'occasion",
          style: TextStyle(
              color: kDarkColor
          ),
        ),
        iconTheme: IconThemeData(
            color: kDarkColor
        ),
        backgroundColor: kWhite,
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: ListView.builder(
        itemCount: _cars.length,
        itemBuilder: (BuildContext context, int index) {
          return SecondHandListTile(
            car: _cars[index],
            onClick: () {
              Navigator.push( context,
                MaterialPageRoute(
                  builder: (context) => CarInfo(_cars[index])
                )
              );
            },
          );
        },
      ),
    );
  }

}
