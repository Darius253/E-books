import 'package:flutter/material.dart';

import '../shared/exports.dart';

class Genre {
  String text;
  String image;
  CustomClipper<Path>? clipper;

  Genre({required this.text, required this.image, required this.clipper});
}

List<Genre> genres = [
  Genre(image: Images.horror, text: 'Horror', clipper: HexagonalClipper()),
  Genre(
      image: Images.adventure,
      text: 'Adventure',
      clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.history, text: 'History', clipper: OvalTopBorderClipper()),
  Genre(
      image: Images.mystery,
      text: 'Mystery',
      clipper: WaveClipperOne(reverse: true, flip: true)),
  Genre(
      image: Images.science,
      text: 'Science',
      clipper: SideCutClipper()),
  Genre(
      image: Images.romance,
      text: 'Romance',
      clipper: MovieTicketBothSidesClipper()),
  Genre(image: Images.comedy, text: 'Comedy', clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.fiction,
      text: 'Fiction',
      clipper: WaveClipperOne(reverse: true, flip: true)),
  Genre(image: Images.poetry, text: 'Poetry', clipper: OvalTopBorderClipper()),
  Genre(image: Images.arts, text: 'Arts', clipper: OctagonalClipper()),
  Genre(
      image: Images.crime,
      text: 'Crime',
      clipper: WaveClipperOne(flip: true, reverse: true)),
  Genre(image: Images.sports, text: 'Sports', clipper: SideCutClipper()),
];
