import 'package:reader_app/shared/exports.dart';

class BookData {
  final String? price;
  final String? name;
  final String image;

  BookData({
    this.price,
    this.name,
    required this.image,
  });
}

List<BookData> books = [
  BookData(
      image: Images.tbook1, name: 'The BookStore Sisters', price: 'GHS 120'),
  BookData(
      image: Images.tbook2, name: 'If You Tell', price: 'GHS 120'),
  BookData(
      image: Images.book1, name: 'Remainders of Him', price: 'GHS 120'),
  BookData(
      image: Images.book2, name: 'The BookStore Sisters', price: 'GHS 120'),
  BookData(
      image: Images.book3, name: 'The BookStore Sisters', price: 'GHS 120'),
  BookData(
      image: Images.book4, name: 'The BookStore Sisters', price: 'GHS 120'),
  BookData(
      image: Images.book5, name: 'The BookStore Sisters', price: 'GHS 120'),
  BookData(
      image: Images.book6, name: 'The BookStore Sisters', price: 'GHS 120'),
];
