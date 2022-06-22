import 'package:flutter/material.dart';

import '../../shared.dart/exports.dart';

class Button extends StatelessWidget {
  final String text;
  final String word;
  final GestureTapCallback onTap;
  const Button(
      {Key? key, required this.text, required this.word, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontFamily: Font.openSans,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(183, 144, 0, 255)),
            ),
            const Expanded(child: SizedBox()),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(183, 144, 0, 255)),
              width: 70,
              height: 70,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {},
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            word,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: Font.openSans,
                color: Color.fromARGB(195, 144, 0, 255),
                fontSize: 15),
          ),
        )
      ],
    );
  }
}
