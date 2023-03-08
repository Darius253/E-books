import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CreaterButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double width;
  final VoidCallback onPressed;

  const CreaterButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.text, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(color: Palette.primary),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                text,
                style: TextStyle(
                    color: textColor, fontWeight: FontWeight.w400, fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
