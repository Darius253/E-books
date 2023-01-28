import 'package:flutter/material.dart';
import 'package:reader_app/shared/constants.dart';
import 'package:reader_app/widgets/text_buttons.dart';

class WelcomePage extends StatefulWidget {
  static const id = 'WelcomePage';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/welcome.png')),
          ),
          Expanded(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               const TextButtons(btext: 'Creator'),
              Container(
                width: 1,
                height: double.infinity,
                color: Palette.grey,
              ),
              const TextButtons(btext: 'Customer')
            ],
          ))
        ],
      ),
    );
  }
}