import '../shared/constants.dart';

class Genre {
  String text;
  String image;

  Genre({
    required this.text,
    required this.image,
  });
}


 List<Genre> genres = [
    Genre(image: Images.horror, text: 'Horro'),
    Genre(image: Images.adventure, text: 'Adventure'),
    Genre(image: Images.history, text: 'History'),
    Genre(image: Images.mystery, text: 'Mystery'),
    Genre(image: Images.science, text: 'Science'),
    Genre(image: Images.romance, text: 'Romance'),
    Genre(image: Images.comedy, text: 'Comedy'),
    Genre(image: Images.fiction, text: 'Fiction'),
    Genre(image: Images.poetry, text: 'Poetry'),
    Genre(image: Images.arts, text: 'Arts'),
    Genre(image: Images.crime, text: 'Crime'),
    Genre(image: Images.sports, text: 'Sports'),
  ];
