import 'package:flutter/material.dart';
import 'package:reader_app/screens/home_screens/library/artstorepart/purchased_arts.dart';
import 'package:reader_app/shared/exports.dart';

class ArtStoreLibrary extends StatefulWidget {
  const ArtStoreLibrary({super.key});

  @override
  State<ArtStoreLibrary> createState() => _ArtStoreLibraryState();
}

class _ArtStoreLibraryState extends State<ArtStoreLibrary> {
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
          child: const PurchasedArts(),
        ),
      ],
    );
  }
}
