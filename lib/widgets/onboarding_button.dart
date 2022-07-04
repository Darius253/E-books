import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final String text;
  final double? width;
  final GestureTapCallback onTap;
  const OnBoardingButton(
      {Key? key,
      this.width,
      required this.color,
      required this.text,
      required this.onTap,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width / 2.5,
        height: 50,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
