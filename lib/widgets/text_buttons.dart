import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color bcolor;
  final Color textcolor;
  final String btext;
  final double fsize;

  const TextButtons({
    super.key,
    required this.btext,
    required this.onTap,
    required this.bcolor,
    required this.textcolor, required this.fsize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              btext,
              style: TextStyle(
                color: textcolor,
                fontSize: fsize,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              height: 1.0,
              width:  70,
              color: bcolor,
            ),
          ],
        ),
      ),
    );
  }
}
