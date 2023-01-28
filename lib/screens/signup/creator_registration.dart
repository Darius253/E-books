

import 'package:flutter/material.dart';
import 'package:reader_app/shared/constants.dart';
import '../../shared/exports.dart';
import '../../widgets/text_buttons.dart';

class CreatorRegistration extends StatefulWidget {
  static const String id = 'creatorRegistration';

  @override
  State<CreatorRegistration> createState() => _CreatorRegistrationState();
}

class _CreatorRegistrationState extends State<CreatorRegistration> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.primary,
      child: SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButtons(bonTap: () {
                  
                }, btext: 'Creator'),
                Container(
                  width: 1,
                  height: 28,
                  color: Palette.grey,
                ),
                TextButtons(bonTap: () {
                  Get.to(WelcomePage());
                }, btext: 'Customer')
              ],
            ),
          ),
    );
  }
}