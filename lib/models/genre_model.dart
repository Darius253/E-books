import 'package:flutter/material.dart';

import '../shared/exports.dart';

class Genre {
  String text;
  String image;
  String genre;
  bool isSelected;
  CustomClipper<Path>? clipper;

  Genre(
      {required this.text,
      required this.image,
      required this.clipper,
      required this.isSelected,
      required this.genre});

  @override
  String toString() {
    return genre;
  }
}

List<Genre> genres = [
  Genre(
    image: Images.horror,
    text: 'Horror',
    clipper: HexagonalClipper(),
    isSelected: false,
    genre: 'Horror',
  ),
  Genre(
    image: Images.adventure,
    text: 'Adventure',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Action and Adventure',
  ),
  Genre(
    image: Images.anthology,
    text: 'Anthology',
    clipper:HexagonalClipper(),
    isSelected: false,
    genre: 'Anthology',
  ),
  Genre(
    image: Images.authobiography,
    text: 'AutoBio',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'AutoBiographies',
  ),
  Genre(
    image: Images.authobiography,
    text: 'Biography',
    clipper:OctagonalClipper(),
    isSelected: false,
    genre: 'Biographies',
  ),
  Genre(
    image: Images.children,
    text: 'Children',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Children',
  ),
  Genre(
    image: Images.comic,
    text: 'Comics',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Comics',
  ),
  Genre(
    image: Images.cook,
    text: 'Cooking',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Cookbooks',
  ),
  Genre(
    image: Images.diaries,
    text: 'Diaries',
    clipper: HexagonalClipper(),
    isSelected: false,
    genre: 'Diaries',
  ),
  Genre(
    image: Images.diaries,
    text: 'Dictionary',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Dictionaries',
  ),
  Genre(
    image: Images.diaries,
    text: 'Encyclopedia',
    clipper:OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Encyclopedias',
  ),
  Genre(
    image: Images.romance,
    text: 'Fantasy',
    clipper: MovieTicketBothSidesClipper(),
    isSelected: false,
    genre: 'Fantasy',
  ),
  Genre(
    image: Images.guide,
    text: 'Guide',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Guide',
  ),
  Genre(
    image: Images.sports,
    text: 'Health',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Health',
  ),
  Genre(
    image: Images.diaries,
    text: 'Journals',
    clipper: WaveClipperOne(reverse: true, flip: true),
    isSelected: false,
    genre: 'Journals',
  ),
  Genre(
    image: Images.math,
    text: 'Math',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Math',
  ),
  Genre(
    image: Images.religion,
    text: 'Prayer Books',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Prayer Books',
  ),
  Genre(
    image: Images.religion,
    text: 'Religion',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Religion, Spiritual, and New Age ',
  ),
  Genre(
    image: Images.comedy,
    text: 'Satire',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Satire',
  ),
  Genre(
    image: Images.self,
    text: 'Self help',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Self help',
  ),
  Genre(
    image: Images.adventure,
    text: 'Series',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Series',
  ),
  Genre(
    image: Images.adventure,
    text: 'Travel',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Travel',
  ),
  Genre(
    image: Images.adventure,
    text: 'Triology',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Triology',
  ),
  Genre(
    image: Images.history,
    text: 'History',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'History',
  ),
  Genre(
    image: Images.mystery,
    text: 'Mystery',
    clipper: WaveClipperOne(reverse: true, flip: true),
    isSelected: false,
    genre: 'Mystery',
  ),
  Genre(
    image: Images.science,
    text: 'Science',
    clipper: SideCutClipper(),
    isSelected: false,
    genre: 'Science',
  ),
  Genre(
    image: Images.romance,
    text: 'Romance',
    clipper: MovieTicketBothSidesClipper(),
    isSelected: false,
    genre: 'Romance',
  ),
  Genre(
    image: Images.fiction,
    text: 'Fiction',
    clipper: WaveClipperOne(reverse: true, flip: true),
    isSelected: false,
    genre: 'Science Fiction',
  ),
  Genre(
    image: Images.poetry,
    text: 'Poetry',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Poetry',
  ),
  Genre(
    image: Images.art,
    text: 'Arts',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Art',
  ),
  Genre(
    image: Images.crime,
    text: 'Drama',
    clipper: WaveClipperOne(flip: true, reverse: true),
    isSelected: false,
    genre: 'Drama',
  ),
  Genre(
    image: Images.sports,
    text: 'Sports',
    clipper: SideCutClipper(),
    isSelected: false,
    genre: 'Sports',
  ),
];
