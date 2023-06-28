import '../shared/constants.dart';

class Art {
  final String image;
  final String title;
  final String artist;
  final String about;
  final String price;
  final String? gallery;
  final String? year;
  final String? id;

  const Art(
      {required this.image,
      required this.title,
      required this.artist,
      required this.about,
      required this.price,
      this.gallery,
      this.year,
      this.id});
}

List<Art> arts = [
  const Art(
      image: Images.adventure,
      title: 'Hail Mary',
      artist: 'Darius',
      about: lorem2,
      gallery: 'TronTech',
      price: '55.0'),
  const Art(
      image: Images.children,
      title: 'Mother',
      artist: 'Blessing',
      about: lorem2,
      gallery: 'TronTech',
      price: '55.0'),
  const Art(
      image: Images.authobiography,
      title: 'Bio',
      artist: 'Jesse',
      about: lorem2,
      gallery: 'TronTech',
      price: '55.0'),
  const Art(
      image: Images.comedy,
      title: 'Hart',
      artist: 'Kelvin',
      about: lorem2,
      gallery: 'TronTech',
      price: '55.0'),
  const Art(
      image: Images.crime,
      title: 'Suspect',
      artist: 'Lloyd',
      about: lorem2,
      gallery: 'TronTech',
      price: '55.0')
];
