import 'package:reader_app/shared/exports.dart';

class Book {
  String imageUrl;
  String title;
  String price;

  Book({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

final List<Book> book = [
  Book(imageUrl: Images.tbook1, title: 'The Bookstore Sisters', price: 'GHS 120'),
  Book(imageUrl: Images.tbook2, title: 'If You Tell', price: 'GHS 120'),
  Book(
      imageUrl: Images.book2,
      title: 'Reminders of Him',
      price: 'GHS 120'),
  Book(imageUrl: Images.book3, title: 'Alien', price: 'GHS 120'),
  Book(imageUrl: Images.book4, title: 'Resting Scrooge Face', price: 'GHS 120'),
  Book(imageUrl: Images.book5, title: 'The Buried Girl', price: 'GHS 120'),
];
