import 'package:flutter/material.dart';

import '../../shared/exports.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  String libraryPart = 'books';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              booksORartsLibraryButtons(),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CURRENTLY READING:",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
               SizedBox(
                height: height * 0.025,
              ),
              SizedBox(
                height: height * 0.26,
                width: width * 0.85,
                child: ListView.builder(
                  itemCount: infodata.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return CarouselCard(
                    infodata: infodata[index],
                  );
                }),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              //wishlistORpurchaseButtons(),
              SizedBox(
                height: height * 0.009,
              ),
              Expanded(child: booksORartsLibrary()),
            ],
          ),
        ),
      ),
    );
  }

  Widget booksORartsLibrary() {
    if (libraryPart == 'books') {
      return const BooksLibrary();
    } else {
      return const ArtStoreLibrary();
    }
  }

  Widget booksORartsLibraryButtons() {
    return SizedBox(
      height: 46,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtons(
            btext: 'Books',
            // bbackgroundColor:
            //     accountType == 'creator' ? Palette.primary : Colors.transparent,
            bcolor:
                libraryPart == 'books' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                libraryPart = 'books';
              });
            },
            textcolor: libraryPart == 'books' ? Palette.primary : Colors.grey,
            fsize: 18,
          ),
          Container(
            width: 1,
            height: 26,
            color: Palette.grey,
          ),
          TextButtons(
            btext: 'Art Store',
            //bbackgroundColor: libraryPart == 'customer' ? Palette.primary : Colors.transparent,
            bcolor:
                libraryPart == 'arts' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                libraryPart = 'arts';
              });
            },
            textcolor: libraryPart == 'arts' ? Palette.primary : Colors.grey,
            fsize: 18,
          ),
        ],
      ),
    );
  }
}
