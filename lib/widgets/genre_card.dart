import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';
Widget genreCard(double width, height, String genre, image) {
  return Container(
    width: width * 0.4,
    height: height * 0.1,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromARGB(232, 140, 63, 4)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          genre,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SvgPicture.asset('assets/images/$image')
      ],
    ),
  );

}
