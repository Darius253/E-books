import 'package:flutter/material.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              container(width, height, 'Currently Reading'),
              SizedBox(width: width * 0.07),
              container(width, height, 'New Releases'),
              SizedBox(width: width * 0.07),
            ],
          ),
        ),
        SizedBox(height: height * 0.07),
        favouriteGenre(
            height, width, 'Adventure', 'My Life', 'Darius Tron', 'GHS 89.99'),
        SizedBox(height: height * 0.07),
        favouriteGenre(height, width, 'Romance', 'How I Met Your Mother',
            'Darius Tron', 'GHS 100'),
        SizedBox(height: height * 0.07),
        favouriteGenre(
            height, width, 'Horror', 'We Broke Up', 'Darius Tron', 'GHS 150'),
      ],
    );
  }

  Widget container(double width, height, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              wordSpacing: 3,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        SizedBox(
          height: height * 0.025,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: width*0.07, vertical: height*0.025),
          width: width * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color.fromARGB(255, 140, 63, 4))),
          child: genreBook(height, width, 'My Life', 'Darius', 'GHS 89.99'),
        )
      ],
    );
  }

  Widget favouriteGenre(
      double height, width, String genre, title, author, price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Because you like $genre ',
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Text(
          'Based your selected genres',
          style: TextStyle(
              height: 2,
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              genreBook(height, width, title, author, price),
              SizedBox(width: width * 0.07),
              genreBook(height, width, title, author, price),
              SizedBox(width: width * 0.07),
              genreBook(height, width, title, author, price),
              SizedBox(width: width * 0.07),
              genreBook(height, width, title, author, price),
              SizedBox(width: width * 0.07),
            ],
          ),
        )
      ],
    );
  }

  Widget genreBook(double height, width, title, author, price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.45,
          height: height * 0.25,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
              borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          'By $author',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          price,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color.fromARGB(255, 140, 63, 4)),
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }
}
