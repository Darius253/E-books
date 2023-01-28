import 'package:flutter/cupertino.dart';
import 'package:reader_app/shared/constants.dart';

class TextButtons extends StatelessWidget {
  final VoidCallback bonTap;
  final String btext;

  const TextButtons({super.key, required this.btext, required this.bonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bonTap,
      child: Container(
        width: 115,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Palette.primary, width: 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              btext,
              style: const TextStyle(
                color: Palette.grey,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}