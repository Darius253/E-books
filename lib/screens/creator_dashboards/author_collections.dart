import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/upload_book.dart';
import '../../shared/exports.dart';

class AuthorCollections extends StatelessWidget {
  const AuthorCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      mainAxisSpacing: 16,
      crossAxisSpacing: 5,
      itemCount: book.length,
      itemBuilder: (BuildContext context, int index) {
        return collection(
            width,
            Random().nextInt(150) + 50.5,
            book[index].author,
            book[index].title,
            book[index].price,
            14,
            context);
      },
    );
  }
}

Widget collection(
    double? width,
    double? height,
    String? artist,
    String? name,
    String? price,
    double? fontSize,
    BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: width! * 0.07,
    ),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.size,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.bottomCenter,
            child: const UploadBook(),
            isIos: true),
      ),
      child: artist == null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  color: Colors.black),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(8),
                      color: Colors.black),
                ),
                SizedBox(
                  height: height! * 0.03,
                ),
                Text(
                  artist,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  name!,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
               
                SizedBox(
                  height: height * 0.03,
                ),
                const Text(
                  'View',
                  style: TextStyle(
                    color: Color(0xFF8C3E04),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
    ),
  );
}
