import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/data/json_ds.dart';
import 'package:s_garage/models/Car.dart';
import 'package:s_garage/screens/cars/widgets/list_tile.dart';
import 'package:s_garage/widgets/menu_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  JsonDataSource _json;
  List<Car> _carsSec = [];
  List<Car> _carsNew = [];

  _MyHomePageState() {
    _json = new JsonDataSource();
    _updateCarList();
  }

  _updateCarList() {
    _json.getSecondHands(nb: 4).then((cars) {
      setState(() {
        _carsSec = cars;
      });
    });
    _json.getNewCars(nb: 4).then((cars) {
      setState(() {
        _carsNew = cars;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S-Garage",
          style: TextStyle(
            color: kDarkColor
          ),
        ),
        backgroundColor: kWhite,
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                "Voitures neuves",
                style: TextStyle(
                    color: kDarkColor
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(20)
              ),
              //height: 60,
              alignment: Alignment.center,
              child: (_carsNew.length > 0) ? _carsNewList() : Text(
                "Aucun véhicule à vendre n'a été trouvé.",
                style: TextStyle(
                    color: kDarkColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(top: 16, left: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                "Dernières occasions arrivées",
                style: TextStyle(
                  color: kDarkColor
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.only(top:20),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20)
              ),
              //height: 60,
              alignment: Alignment.center,
              child: (_carsSec.length > 0) ? _carsList() : Text(
                "Aucun véhicule à vendre n'a été trouvé.",
                style: TextStyle(
                  color: kDarkColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carsList() {
    List<Widget> list = [];
    _carsSec.forEach((car) {
      list.add(CarListTile(
        car: car,
        onClick: () {},
      ));
    });
    list.add(ListTile(
      title: Text(
        "Voir toutes les occasions",
        style: TextStyle(
          color: kDarkColor,
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: kDarkColor,
      ),
      onTap: () {

      },
    ));
    return Column(
      children: list,
    );
  }

  Widget _carsNewList() {
    List<Widget> list = [];
    _carsNew.forEach((car) {
      list.add(Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${car.mark} ${car.model}",
                  style: TextStyle(
                      color: kDarkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Text(
                  " € ${car.price.toStringAsFixed(0)}",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Image(
              image: NetworkImage(car.images[0]),
              width: MediaQuery.of(context).size.width - 30,
            )
          ],
        ),
      ));
    });
    return Column(
      children: list,
    );
  }

  Widget _tempBody() {
    return Column(
      children: <Widget>[
        MenuCard(
            onClick: () {},
            backgroundColor: kWhite,
            iconColor: kMainColor,
            icon: Icons.car_repair,
            text: "REPAIR",
            size: (MediaQuery.of(context).size.height - 90) / 2
        ),
        SizedBox(height: 30),
        MenuCard(
            onClick: () {

            },
            backgroundColor: kMainColor,
            iconColor: kWhite,
            icon: Icons.attach_money,
            text: "BUY",
            size: (MediaQuery.of(context).size.height -90) / 2
        ),
      ],
    );
  }

}
