import 'package:flutter/material.dart';

Widget purchaseButton(
  String text,
) {
  return Container(
    width: 102,
    height: 35,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: ShapeDecoration(
      color: const Color(0xFFED7117),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFFFEFAF6),
        fontSize: 14,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
