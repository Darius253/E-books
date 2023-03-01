import 'package:flutter/material.dart';

import '../../shared/exports.dart';

class OnBoardButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color bordercolor;
  final String text;
  final VoidCallback onPressed;

  const OnBoardButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.text, required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(color: bordercolor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
