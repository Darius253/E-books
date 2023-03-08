import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class PurchaseArtPart extends StatefulWidget {
  const PurchaseArtPart({super.key});

  @override
  State<PurchaseArtPart> createState() => _PurchaseArtPartState();
}

class _PurchaseArtPartState extends State<PurchaseArtPart> {
  String wtypePart = 'purchase';
  @override
  Widget build(BuildContext context) {
    return const PurchaseCard();
  }
}
