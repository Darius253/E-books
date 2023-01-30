import 'package:flutter/material.dart';
import 'package:reader_app/shared/constants.dart';

class ExSignUpButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String image;
  const ExSignUpButton({super.key, required this.text, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 310,
      height: 45,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          color: Palette.grey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 40),
                Text("Continue with $text"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}