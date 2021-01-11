
import 'package:flutter/material.dart';
import 'package:s_garage/constants.dart';
import 'package:s_garage/models/Car.dart';

class CarListTile extends StatelessWidget {

  final Car car;
  final Function onClick;

  CarListTile({
    @required this.car,
    @required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: kWhite,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: NetworkImage(this.car.images[0]),
          width: 100,
        ),
      ),
      title: Text(
        "${this.car.mark} ${this.car.model}",
        style: TextStyle(
            color: kDarkColor,
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            "€ ${this.car.price.toStringAsFixed(0)}",
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            " - ${this.car.km} km",
            style: TextStyle(
                color: kDarkColor,
                fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: kDarkColor,
      ),
      onTap: this.onClick
    );
  }

}