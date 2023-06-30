import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BooksLibrary extends StatefulWidget {
  const BooksLibrary({super.key});

  @override
  State<BooksLibrary> createState() => _BooksLibraryState();
}

class _BooksLibraryState extends State<BooksLibrary> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: purchaseButton('Purchases')),
        const SizedBox(
          height: 26,
        ),
        SizedBox(
          height: height * 0.46,
          child: const PurchasedBooks(),
        ),
      ],
    );
  }
}
