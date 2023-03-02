import 'package:flutter/material.dart';
import 'package:reader_app/shared/constants.dart';

class GenreChips extends StatelessWidget {
  final GenreData bookgenres;

  const GenreChips({
    super.key,
    required this.bookgenres,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(0),
      label: Text(
        bookgenres.bookgenre,
        style: const TextStyle(
          color: Palette.black,
          fontSize: 10.0,
        ),
      ),
      backgroundColor: Colors.transparent,
      shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
    );
  }
}

class GenreData {
  final String bookgenre;

  GenreData(this.bookgenre);
}

List<GenreData> bookgenres = [
  GenreData('adventure'),
  GenreData('Mystery'),
  GenreData('Thriller'),
];
