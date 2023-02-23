import 'package:flutter/material.dart';
import 'package:reader_app/screens/library/artstore_library.dart';
import 'package:reader_app/screens/library/books_library.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  String libraryPart = 'books';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }

  Widget bookStoreOrArtStore() {
    if (libraryPart == 'books') {
      return const BooksLibrary();
    } else {
      return const ArtStoreLibrary();
    }
  }

}
