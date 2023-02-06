import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final Color bbcolor;
  final String btext;
  final VoidCallback bonPressed;
  const ConfirmButton({super.key, required this.bbcolor, required this.btext, required this.bonPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: TextButton(
        style: ButtonStyle( backgroundColor: MaterialStatePropertyAll(bbcolor),
        overlayColor: const MaterialStatePropertyAll(Colors.white10),
        ),
        onPressed: bonPressed,
        child: Text(btext, style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),),
      ),
    );
  }
}