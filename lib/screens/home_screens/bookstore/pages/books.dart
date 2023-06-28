import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookPage extends StatefulWidget {
  final String genre;
  const BookPage({Key? key, required this.genre}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.015,
            ),
            Text(
              widget.genre,
              style: const TextStyle(
                fontSize: 24,
                color: Palette.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.90,
              child: const Divider(
                height: 1.0,
                color: Color.fromARGB(255, 71, 71, 71),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: height * 0.7,
                child: ListView.builder(
                  itemCount: book.length,
                  itemBuilder: (context, index) {
                    if (index >= book.length) {
                      return Container(); 
                    }
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => Get.to(
                            () => BookPreview(
                              bookTitle: book[index].title,
                              authorName: book[index].author,
                            ),
                          ),
                          child: BookInfo(
                            book: book[index],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        if (index != book.length - 1)
                          SizedBox(
                            width: width * 0.90,
                            child: const Divider(
                              height: 1.0,
                              color: Color.fromARGB(255, 71, 71, 71),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
