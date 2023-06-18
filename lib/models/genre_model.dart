import 'package:flutter/material.dart';

import '../shared/exports.dart';

class Genre {
  String text;
  String image;
  CustomClipper<Path>? clipper;

  Genre({required this.text, required this.image, required this.clipper});
}

List<Genre> genres = [
  Genre(
    image: Images.horror,
    text: 'Horror',
    clipper: HexagonalClipper(),
  ),
  Genre(
      image: Images.adventure,
      text: 'Adventure',
      clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.anthology,
      text: 'Anthology',
      clipper: OvalTopBorderClipper()),
  Genre(
      image: Images.authobiography,
      text: 'AutoBio',
      clipper: OctagonalClipper()),
  Genre(
      image: Images.authobiography,
      text: 'Biography',
      clipper:OvalRightBorderClipper()),
  Genre(image: Images.children, text: 'Children', clipper: SideCutClipper()),
  Genre(image: Images.comic, text: 'Comics', clipper: OctagonalClipper()),
  Genre(
      image: Images.cook, text: 'Cooking', clipper: OvalTopBorderClipper()),
  Genre(
      image: Images.diaries, text: 'Diaries', clipper:  HexagonalClipper()),
  Genre(
      image: Images.diaries,
      text: 'Dictionary',
      clipper: HexagonalClipper()),
  Genre(
      image: Images.diaries,
      text: 'Encyclopedia',
      clipper: HexagonalClipper()),
  Genre(
      image: Images.romance, text: 'Fantasy', clipper: OvalLeftBorderClipper()),
  Genre(image: Images.guide, text: 'Guide', clipper: WaveClipperOne(reverse: true, flip: true)),
  Genre(image: Images.sports, text: 'Health', clipper: OvalTopBorderClipper()),
  Genre(
      image: Images.diaries,
      text: 'Journals',
      clipper: WaveClipperOne(reverse: true, flip: true)),
  Genre(image: Images.math, text: 'Math', clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.religion,
      text: 'Prayer Books',
      clipper: OvalTopBorderClipper()),
  Genre(
      image: Images.religion,
      text: 'Religion',
      clipper: OvalLeftBorderClipper()),
  Genre(image: Images.comedy, text: 'Satire', clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.self, text: 'Self help', clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.adventure,
      text: 'Series',
      clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.adventure,
      text: 'Travel',
      clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.adventure,
      text: 'Triology',
      clipper: OvalLeftBorderClipper()),
  Genre(
      image: Images.history, text: 'History', clipper: OvalTopBorderClipper()),
  Genre(
      image: Images.mystery,
      text: 'Mystery',
      clipper: WaveClipperOne(reverse: true, flip: true)),
  Genre(image: Images.science, text: 'Science', clipper: SideCutClipper()),
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
  Genre(image: Images.art, text: 'Arts', clipper: OctagonalClipper()),
  Genre(
      image: Images.crime,
      text: 'Drama',
      clipper: WaveClipperOne(flip: true, reverse: true)),
  Genre(image: Images.sports, text: 'Sports', clipper: SideCutClipper()),
];
