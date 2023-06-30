
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final GestureTapCallback onTap;
  const Button({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 112, 23),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
