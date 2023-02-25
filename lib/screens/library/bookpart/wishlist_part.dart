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
      itemCount: infodata.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(9),
          child: ListTile(
            onTap: (){
              Get.to(const BookPreview());
            },
            leading: Image.asset(infodata[index].image),
            title: Text(
              '${infodata[index].title}\nby ${infodata[index].author}',
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
