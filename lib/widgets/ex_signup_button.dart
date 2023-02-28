import 'package:flutter/material.dart';

class ExSignUpButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String image;
  const ExSignUpButton({super.key, required this.text, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.06,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 206, 206),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
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
            const SizedBox(width: 50),
            Text("Continue with $text"),
          ],
        ),
      ),
    );
  }
}