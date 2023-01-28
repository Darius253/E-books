import 'package:flutter/cupertino.dart';
import 'package:reader_app/shared/constants.dart';

class TextButtons extends StatelessWidget {
  final String btext;

  const TextButtons({super.key, required this.btext});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 115,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Palette.primary, width: 5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  btext,
                  style: TextStyle(
                    color: Palette.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}