import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/constants.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Login',
            style: const TextStyle(color: Palette.primary),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                
              },
          ),
        ],
      ),
    );
  }
}