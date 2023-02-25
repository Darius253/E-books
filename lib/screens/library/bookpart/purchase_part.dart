import 'package:flutter/material.dart';

class PurchasePart extends StatefulWidget {
  const PurchasePart({super.key});

  @override
  State<PurchasePart> createState() => _PurchasePartState();
}

class _PurchasePartState extends State<PurchasePart> {
  String typePart = 'purchase';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
