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
];
