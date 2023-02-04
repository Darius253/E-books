import 'package:flutter/material.dart';

import '../shared/exports.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GetStartedButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 42,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Palette.white),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
                color: Palette.black, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
