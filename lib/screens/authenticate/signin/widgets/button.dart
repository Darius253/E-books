
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  const Button({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 112, 23),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
