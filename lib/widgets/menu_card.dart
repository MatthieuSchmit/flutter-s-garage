/*
 * s_garage - widgets/menu_card
 *
 * by Matthieu S. at 10-01-21 15:20
 *
 */

import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {

  final IconData icon;
  final Function onClick;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final String text;

  MenuCard({
    @required this.icon,
    @required this.onClick,
    @required this.backgroundColor,
    @required this.iconColor,
    @required this.size,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onClick,
      child: Container(
        padding: EdgeInsets.all(20),
        width: this.size,
        height: this.size,
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(20)
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              this.text,
              style: TextStyle(
                color: this.iconColor,
                fontSize: this.size * 0.1,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              this.icon,
              color: this.iconColor,
              size: this.size * 0.7,
            ),
          ],
        )
      ),
    );
  }

}
 