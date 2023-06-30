import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

Widget signIn(BuildContext context) {
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
              Get.to(() => const SignIn());
            },
        ),
      ],
    ),
  );
}

Widget signUp(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        const TextSpan(
            text: 'Are you need new here? ',
            style: TextStyle(color: Colors.black)),
        TextSpan(
          text: 'Signup',
          style: const TextStyle(color: Palette.primary),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.to(() => const SignUpPage());
            },
        ),
      ],
    ),
  );
}
