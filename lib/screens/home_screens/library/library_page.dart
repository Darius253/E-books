import 'package:flutter/material.dart';

import '../../../shared/exports.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  String section = 'books';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            booksORartsLibraryButtons(height),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    section == 'books'
                        ? 'CURRENTLY READING'
                        : 'RECENTLY VIEWED',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            SizedBox(
              height: height * 0.2,
              child: ListView.builder(
                  itemCount: book.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return section == 'books'
                        ? CurrentlyReadingBooks(
                            book: book[index],
                          )
                        : art(width * 0.5, height * 0.15, null, null, null,
                            null, null, context);
                  }),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.009,
            ),
            Expanded(child: booksORartsLibrary()),
          ],
        ),
      ),
    );
  }

  Widget booksORartsLibrary() {
    if (section == 'books') {
      return const BooksLibrary();
    } else {
      return const ArtStoreLibrary();
    }
  }

  Widget booksORartsLibraryButtons(double height) {
    return SizedBox(
      height: height * 0.065,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtons(
            btext: 'Books',
            bcolor: section == 'books' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                section = 'books';
              });
            },
            textcolor: section == 'books' ? Palette.primary : Colors.black,
            fsize: 14,
          ),
          Container(
            width: 1,
            height: 26,
            color: Palette.grey,
          ),
          TextButtons(
            btext: 'Art Store',
            bcolor: section == 'arts' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                section = 'arts';
              });
            },
            textcolor: section == 'arts' ? Palette.primary : Colors.black,
            fsize: 14,
          ),
        ],
      ),
    );
  }
}
