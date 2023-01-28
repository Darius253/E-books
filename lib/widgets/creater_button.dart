import 'package:flutter/material.dart';

import '../shared/exports.dart';

class CreaterButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  const CreaterButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 150,
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
                    color: textColor, fontWeight: FontWeight.w500, fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
