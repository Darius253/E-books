import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BooksLibrary extends StatefulWidget {
  const BooksLibrary({super.key});

  @override
  State<BooksLibrary> createState() => _BooksLibraryState();
}

class _BooksLibraryState extends State<BooksLibrary> {
  String libraryPart = 'books';
  String typePart = 'wishlist';
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
    if (typePart == 'wishlist') {
      return const WishlistPart();
    } else {
      return const PurchasePart();
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
                typePart == 'wishlist' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                typePart = 'wishlist';
              });
            },
            textcolor: typePart == 'wishlist' ? Palette.primary : Colors.grey,
            fsize: 12,
          ),
          OvalButtons(
            btext: 'Purchases',
            //bbackgroundColor: libraryPart == 'customer' ? Palette.primary : Colors.transparent,
            bcolor:
                typePart == 'purchase' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                typePart = 'purchase';
              });
            },
            textcolor: typePart == 'purchase' ? Palette.primary : Colors.grey,
            fsize: 12,
          ),
        ],
      ),
    );
  }
}