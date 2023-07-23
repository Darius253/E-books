import 'package:flutter/material.dart';

import '../shared/exports.dart';

class Genre {
  String text;
  String image;
  String genre;
  bool isSelected;
  int id;
  CustomClipper<Path>? clipper;

  Genre(
      {required this.text,
      required this.image,
      required this.clipper,
      required this.isSelected,
      required this.id,
      required this.genre});

  @override
  int toInt() {
    return id;
  }
}

List<Genre> genres = [
  Genre(
    image: Images.horror,
    text: 'Horror',
    clipper: HexagonalClipper(),
    isSelected: false,
    id: 6,
    genre: 'Horror',
  ),
  Genre(
    image: Images.adventure,
    text: 'Adventure',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Action and Adventure',
    id: 5,
  ),
  Genre(
    image: Images.anthology,
    text: 'Anthology',
    clipper: HexagonalClipper(),
    isSelected: false,
    genre: 'Anthology',
    id:18,
  ),
  Genre(
    image: Images.authobiography,
    text: 'AutoBio',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'AutoBiographies',
    id:30,
  ),
  Genre(
    image: Images.authobiography,
    text: 'Biography',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Biographies',
    id:29,
  ),
  Genre(
    image: Images.children,
    text: 'Children',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Children',
    id:15,
  ),
  Genre(
    image: Images.comic,
    text: 'Comics',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Comics',
    id: 21,
  ),
  Genre(
    image: Images.cook,
    text: 'Cooking',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Cookbooks',
    id: 23,
  ),
  Genre(
    image: Images.diaries,
    text: 'Diaries',
    clipper: HexagonalClipper(),
    isSelected: false,
    genre: 'Diaries',
    id: 24,
  ),
  Genre(
    image: Images.diaries,
    text: 'Dictionary',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Dictionaries',
    id: 20,
  ),
  Genre(
    image: Images.diaries,
    text: 'Encyclopedia',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Encyclopedias',
    id: 19,
  ),
  Genre(
    image: Images.romance,
    text: 'Fantasy',
    clipper: MovieTicketBothSidesClipper(),
    isSelected: false,
    genre: 'Fantasy',
    id: 3,
  ),
  Genre(
    image: Images.guide,
    text: 'Guide',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Guide',
    id: 9,
  ),
  Genre(
    image: Images.sports,
    text: 'Health',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Health',
    id: 10,
  ),
  Genre(
    image: Images.diaries,
    text: 'Journals',
    clipper: WaveClipperOne(reverse: true, flip: true),
    isSelected: false,
    genre: 'Journals',
    id:25,
  ),
  Genre(
    image: Images.math,
    text: 'Math',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Math',
    id: 17,
  ),
  Genre(
    image: Images.religion,
    text: 'Prayer Books',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Prayer Books',
    id: 27,
  ),
  Genre(
    image: Images.religion,
    text: 'Religion',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Religion, Spiritual, and New Age ',
    id: 13,
  ),
  Genre(
    image: Images.comedy,
    text: 'Satire',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Satire',
    id: 2,
  ),
  Genre(
    image: Images.self,
    text: 'Self help',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Self help',
    id: 4,
  ),
  Genre(
    image: Images.adventure,
    text: 'Series',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Series',
    id: 26,
  ),
  Genre(
    image: Images.adventure,
    text: 'Travel',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Travel',
    id: 11,
  ),
  Genre(
    image: Images.adventure,
    text: 'Trilogy',
    clipper: OvalLeftBorderClipper(),
    isSelected: false,
    genre: 'Trilogy',
    id: 28,
  ),
  Genre(
    image: Images.history,
    text: 'History',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'History',
    id: 14,
  ),
  Genre(
    image: Images.mystery,
    text: 'Mystery',
    clipper: WaveClipperOne(reverse: true, flip: true),
    isSelected: false,
    genre: 'Mystery',
    id: 8,
  ),
  Genre(
    image: Images.science,
    text: 'Science',
    clipper: SideCutClipper(),
    isSelected: false,
    genre: 'Science',
    id: 12,
  ),
  Genre(
    image: Images.romance,
    text: 'Romance',
    clipper: MovieTicketBothSidesClipper(),
    isSelected: false,
    genre: 'Romance',
    id: 3,
  ),
  Genre(
    image: Images.fiction,
    text: 'Fiction',
    clipper: WaveClipperOne(reverse: true, flip: true),
    isSelected: false,
    genre: 'Science Fiction',
    id: 1,
  ),
  Genre(
    image: Images.poetry,
    text: 'Poetry',
    clipper: OvalTopBorderClipper(),
    isSelected: false,
    genre: 'Poetry',
    id: 16,
  ),
  Genre(
    image: Images.art,
    text: 'Arts',
    clipper: OctagonalClipper(),
    isSelected: false,
    genre: 'Art',
    id: 22,
  ),
  Genre(
    image: Images.crime,
    text: 'Drama',
    clipper: WaveClipperOne(flip: true, reverse: true),
    isSelected: false,
    genre: 'Drama',
    id: 7,
  ),
  // Genre(
  //   image: Images.sports,
  //   text: 'Sports',
  //   clipper: SideCutClipper(),
  //   isSelected: false,
  //   genre: 'Sports',
  //   id: 
  // ),
];
