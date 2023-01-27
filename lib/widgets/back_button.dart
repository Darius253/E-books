import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class Back extends StatelessWidget {
  const Back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 40),
      child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          )),
    );
  }
}
