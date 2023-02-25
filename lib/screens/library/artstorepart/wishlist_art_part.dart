import 'package:flutter/material.dart';

class WishlistArtPart extends StatefulWidget {
  const WishlistArtPart({super.key});

  @override
  State<WishlistArtPart> createState() => _WishlistArtPartState();
}

class _WishlistArtPartState extends State<WishlistArtPart> {
  String wtypePart = 'wishlist';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
