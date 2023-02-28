import 'package:flutter/material.dart';

Widget navBarItem(String itemName, double height, IconData icon, Color color, Function()? ontap) {
  return InkWell(
    onTap: ontap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
         icon,
          color: color,
          size: height * 0.035,
        ),
        Text(itemName, style: TextStyle(color: color),),
      ],
    ),
  );
}
