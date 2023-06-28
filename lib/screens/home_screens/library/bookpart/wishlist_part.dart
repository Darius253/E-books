import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class WishlistPart extends StatefulWidget {
   const WishlistPart({super.key});

  @override
  State<WishlistPart> createState() => _WishlistPartState();
}

class _WishlistPartState extends State<WishlistPart> {
  
  String typePart = 'wishlist';
  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: book.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(9),
          child: ListTile(
            onTap: (){
              Get.to(const BookPeview(bookAuthor: 'Eric Atsu', bookDescription: lorem, bookImageUrl: Images.book1, bookTitle: 'The Boys',));
            },
            leading: Image.asset(book[index].image),
            title: Text(
              '${book[index].title}\nby ${book[index].author}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
