
import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/data/json_ds.dart';
import 'package:s_garage/models/Car.dart';
import 'package:s_garage/screens/widgets/new_car_card.dart';

class ListNew extends StatefulWidget {
  @override
  _ListNew createState() => _ListNew();
}

class _ListNew extends State<ListNew> {

  List<Car> _cars;
  JsonDataSource _json;

  _ListNew() {
    _json = new JsonDataSource();
    _updateCarList();
  }

  _updateCarList() {
    _json.getNewCars().then((cars) {
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
          "Voitures neuves",
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
      body: SingleChildScrollView(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    List<Widget> list = [];

    _cars.forEach((element) {
      list.add(Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(20)
        ),
        alignment: Alignment.center,
        child: NewCarCard(
          car: element,
        ),
      ));
    });

    return Column(children: list);
  }

}
