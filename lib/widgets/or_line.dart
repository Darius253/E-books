import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Expanded(child: Divider()),
      Text(" Or "),
      Expanded(child: Divider()),
    ]);
  }
}