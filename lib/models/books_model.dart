
import '../shared/constants.dart';

class Book {
  final String image;
  final String title;
  final String author;
  final String desc;
  final String price;
  final String genre;
  final String? id;

  const Book(
      {required this.image,
      required this.title,
      required this.author,
      required this.desc,
      required this.price,
      required this.genre,
      this.id});
}

List<Book> book = [
  const Book(
      image: Images.tbook1,
      title: 'Ugly',
      author: 'Him',
      desc: lorem2,
      price: 'GHS 89',
      genre: 'Fantansy'),
  const Book(
      image: Images.tbook2,
      title: 'Merchant of Venom',
      author: 'Seth',
      desc: lorem2,
      price: 'GHS 89',
      genre: 'Comic'),
  const Book(
      image: Images.book1,
      title: 'Goal',
      author: 'Michael',
      desc: lorem2,
      price: 'GHS 89',
      genre: 'Action and Adventures'),
  const Book(
      image: Images.book4,
      title: 'Merchant',
      author: 'Tron',
      desc: lorem2,
      price: 'GHS 89',
      genre: 'Romancr'),
  const Book(
      image: Images.tbook1,
      title: 'Venom',
      author: 'Darius',
      desc: lorem2,
      price: 'GHS 89',
      genre: 'Travel'),
];
