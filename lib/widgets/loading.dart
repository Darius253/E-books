import 'package:flutter/material.dart';
import 'package:reader_app/shared/constants.dart';

Widget loader() {
  return const Center(
    child: CircularProgressIndicator.adaptive(
      backgroundColor: Palette.primary,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    ),
  );
}
