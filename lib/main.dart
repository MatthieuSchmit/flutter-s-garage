import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/screens/cars/list/cars_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Container(
        padding: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CarList())
                );
              },
              backgroundColor: kMainColor,
              iconColor: kWhite,
              icon: Icons.attach_money,
              text: "BUY",
              size: (MediaQuery.of(context).size.height -90) / 2
            ),
          ],
        ),
      ),
    );
  }
}
