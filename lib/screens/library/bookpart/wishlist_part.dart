
import 'package:flutter/material.dart';

class WishlistPart extends StatefulWidget {
  const WishlistPart({super.key});

  @override
  State<WishlistPart> createState() => _WishlistPartState();
}

class _WishlistPartState extends State<WishlistPart> {
  String typePart = 'wishlist';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
