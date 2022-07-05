import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookInfoItem extends StatelessWidget {
  final String title, subtitle;
  const BookInfoItem({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18.0,
            color: Palette.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
