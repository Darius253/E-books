import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class Button extends StatelessWidget {
  final String text;
  final String word;
  final GestureTapCallback onTap;
  final VoidCallback onPressed;
  const Button(
      {Key? key,
      required this.text,
      required this.word,
      required this.onTap,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontFamily:
                      Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(242, 237, 112, 23)),
            ),
            const Expanded(child: SizedBox()),
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(242, 237, 112, 23)),
              width: 70,
              height: 70,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: onPressed,
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
            style: TextStyle(
                fontFamily: Platform.isIOS ? Font.sanfrancisco : Font.proxinova,
                decoration: TextDecoration.underline,
                fontSize: 15),
          ),
        )
      ],
    );
  }
}
