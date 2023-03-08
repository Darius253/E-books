import 'package:flutter/material.dart';

class OvalButtons extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color bcolor;
  final Color textcolor;
  final String btext;
  final double fsize;

  const OvalButtons({
    super.key,
    required this.btext,
    required this.onTap,
    required this.bcolor,
    required this.textcolor,
    required this.fsize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 80,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          //padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          elevation: 0,
          backgroundColor: bcolor,
          shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.transparent),
            ),
          ), 
        child: Text(
          btext,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fsize,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}
