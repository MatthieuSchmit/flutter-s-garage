
import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/models/Car.dart';

class NewCarCard extends StatelessWidget {

  final Car car;

  NewCarCard({
    @required this.car
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 1000),
      child: Container(
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
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(car.images[0]),
                      fit: BoxFit.contain
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

}
