import 'package:flutter/material.dart';
import 'package:reader_app/screens/library/bookpart/widget/purchase_card.dart';

class PurchasePart extends StatefulWidget {
  const PurchasePart({super.key});

  @override
  State<PurchasePart> createState() => _PurchasePartState();
}

class _PurchasePartState extends State<PurchasePart> {
  String typePart = 'purchase';
  @override
  Widget build(BuildContext context) {
    return PurchaseCard();
  }
}
