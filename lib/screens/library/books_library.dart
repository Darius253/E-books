import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BooksLibrary extends StatefulWidget {
  const BooksLibrary({super.key});

  @override
  State<BooksLibrary> createState() => _BooksLibraryState();
}

class _BooksLibraryState extends State<BooksLibrary> {
  String libraryPart = 'books';
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}