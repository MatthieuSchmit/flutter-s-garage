import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/models/Car.dart';

class CarInfo extends StatefulWidget {
  Car _car;
  CarInfo(Car car) {
    _car = car;
  }
  @override
  _CarInfo createState() => _CarInfo(_car);
}

class _CarInfo extends State<CarInfo> {

  Car _car;
  int _imageIndex = 0;

  _CarInfo(Car car) {
    _car = car;
    print("${_car.images.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${_car.mark} ${_car.model}",
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width - 16,
              alignment: Alignment.center,
              height: 250,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    onTap: () {
                      setState(() {
                        _imageIndex --;
                        if (_imageIndex == -1) _imageIndex = _car.images.length - 1;
                      });
                      print("$_imageIndex");
                    },
                  ),
                  Expanded(
                    child: Container(
                      //width: MediaQuery.of(context).size.width - 80,
                      height: 230,
                      child: Image(
                        image: NetworkImage(_car.images[_imageIndex]),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                    onTap: () {
                      setState(() {
                        _imageIndex ++;
                        if (_imageIndex == _car.images.length) _imageIndex = 0;
                      });
                    },
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.euro,
                      color: kDarkColor,
                    ),
                    title: Text(
                      "Prix",
                      style: TextStyle(
                        color: kDarkColor
                      ),
                    ),
                    trailing: Text(
                      "${_car.price.toStringAsFixed(0)} €",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  if (_car.km != 0) ListTile(
                    leading: Icon(
                      Icons.airport_shuttle_outlined,
                      color: kDarkColor,
                    ),
                    title: Text(
                      "KM",
                      style: TextStyle(
                          color: kDarkColor
                      ),
                    ),
                    trailing: Text(
                        "${_car.km.toStringAsFixed(0)} km"
                    ),
                  ),
                  if (_car.km != 0) ListTile(
                    leading: Icon(
                      Icons.calendar_today_outlined,
                      color: kDarkColor,
                    ),
                    title: Text(
                      "Année",
                      style: TextStyle(
                          color: kDarkColor
                      ),
                    ),
                    trailing: Text(
                      "${_car.date}"
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: kDarkColor,
                    ),
                    title: Text(
                      "Boîte",
                      style: TextStyle(
                          color: kDarkColor
                      ),
                    ),
                    trailing: Text(
                        "${_car.transmission} ${_car.gears}"
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.agriculture_sharp,
                      color: kDarkColor,
                    ),
                    title: Text(
                      "Fuel",
                      style: TextStyle(
                          color: kDarkColor
                      ),
                    ),
                    trailing: Text(
                        "${_car.fuel}"
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.power,
                      color: kDarkColor,
                    ),
                    title: Text(
                      "Power",
                      style: TextStyle(
                          color: kDarkColor
                      ),
                    ),
                    trailing: Text(
                        "${_car.power} kW - ${_car.horsepower} CV"
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: ListTile(
                title: Text(
                  (_car.km != 0) ? "Contacter le vendeur" : "Contacter le garage",
                  style: TextStyle(
                    color: kDarkColor
                  ),
                ),
                leading: Icon(
                  Icons.email,
                  color: kDarkColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}