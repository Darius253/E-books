import 'package:flutter/material.dart';
import 'package:reader_app/screens/library/artstorepart/purchase_art_part.dart';
import 'package:reader_app/screens/library/artstorepart/wishlist_art_part.dart';
import 'package:reader_app/shared/exports.dart';

class ArtStoreLibrary extends StatefulWidget {
  const ArtStoreLibrary({super.key});

  @override
  State<ArtStoreLibrary> createState() => _ArtStoreLibraryState();
}

class _ArtStoreLibraryState extends State<ArtStoreLibrary> {
  String libraryPart = 'artstore';
  String wtypePart = 'wishlist';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.5,
      child: Column(
        children: [
          wishlistORpurchaseButtons(),
          Expanded(child: wishlistORpurchase())
        ],
      ),
    );
  }

  Widget wishlistORpurchase() {
    if (wtypePart == 'wishlist') {
      return const WishlistArtPart();
    } else {
      return const PurchaseArtPart();
    }
  }

  Widget wishlistORpurchaseButtons() {
    return SizedBox(
      height: 42,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OvalButtons(
            btext: 'Wishlist',
            // bbackgroundColor:
            //     accountType == 'creator' ? Palette.primary : Colors.transparent,
            bcolor:
                wtypePart == 'wishlist' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                wtypePart = 'wishlist';
              });
            },
            textcolor: wtypePart == 'wishlist' ? Palette.primary : Colors.grey,
            fsize: 12,
          ),
          OvalButtons(
            btext: 'Purchases',
            //bbackgroundColor: libraryPart == 'customer' ? Palette.primary : Colors.transparent,
            bcolor:
                wtypePart == 'purchase' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                wtypePart = 'purchase';
              });
            },
            textcolor: wtypePart == 'purchase' ? Palette.primary : Colors.grey,
            fsize: 12,
          ),
        ],
      ),
    );
  }
}
