import 'package:flutter/material.dart';

class OnBoardButton extends StatelessWidget {
  final String obtext;
  final Color textcolor;
  final VoidCallback obonpressed;
  const OnBoardButton({super.key, required this.obtext, required this.obonpressed, required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
    onPressed: obonpressed,
    style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))),
        ),
     child: Text(obtext,
     style: TextStyle(
      color: textcolor,
     ),
     ));
  }
}