import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookInfo extends StatelessWidget {
  final Book book;
  const BookInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset(
            book.image,
            height: height * 0.18,
            width: width * 0.23,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text.rich(TextSpan(children: [
                  const TextSpan(
                      text: 'by ',
                      style: TextStyle(
                          color: Palette.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                    text: book.author,
                    style: const TextStyle(
                        color: Palette.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ])),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  book.desc,
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  book.price,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


