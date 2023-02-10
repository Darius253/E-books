import 'package:flutter/material.dart';

class GenreButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final Color bcolor;
  final Color textcolor;
  final Color brcolor;

  const GenreButton({super.key, required this.text, required this.onTap, required this.bcolor, required this.textcolor, required this.brcolor,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bcolor,
            border: Border.all(
              color: brcolor,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          constraints: const BoxConstraints(
            minWidth: 45.0,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 11.0,
                color: textcolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
