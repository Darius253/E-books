import 'package:flutter/material.dart';
import 'package:reader_app/screens/home_screens/book_preview.dart';

class BookShelf extends StatelessWidget {
  @override
  final Key? key;
  const BookShelf({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genre = ['Adventure', 'Romance', 'Horror', 'Sports'];
    List<String> book = [
      'My life',
      'How I Met Your Mother',
      'We Broke Up',
      'Dream Big'
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.07),
            child: const Text(
              'Currently Reading',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          container(width, height, context),
          // SizedBox(
          //   height: height * 0.4,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //       // Column(
          //       //   crossAxisAlignment: CrossAxisAlignment.start,
          //       //   children: [
          //       //     Padding(
          //       //       padding: EdgeInsets.only(left: width * 0.07),
          //       //       child: const Text(
          //       //         'Currently Reading',
          //       //         style: TextStyle(
          //       //             fontSize: 16, fontWeight: FontWeight.w600),
          //       //       ),
          //       //     ),
          //       //     container(width, height, context),
          //       //   ],
          //       // ),

          //     ],
          //   ),
          // ),
          SizedBox(
            height: height * 0.035,
          ),
          SizedBox(
            height: height * 0.8,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: height * 0.05,
                  );
                },
                itemCount: genre.length,
                itemBuilder: (BuildContext context, int index) {
                  return favouriteGenre(height, width, genre[index],
                      book[index], 'Darius Tron', 'GHS 89.99', context);
                }),
          )
        ]),
      ),
    );
  }

  Widget container(double width, double height, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.07,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            width: width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(color: const Color.fromARGB(255, 140, 63, 4))),
            child: genreBook(
                height, width, 'My Life', 'Darius', 'GHS 89.99', context),
          ),
        ),
      ],
    );
  }

  Widget favouriteGenre(double height, double width, String genre, title,
      author, price, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.07,
          ),
          child: Text(
            'Because you like $genre ',
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.07,
          ),
          child: const Text(
            'Based your selected genres',
            style: TextStyle(
                height: 2,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        SizedBox(
          height: height * 0.35,
          width: width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: height * 0.05,
                );
              },
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return genreBook(height, width, title, author, price, context);
              }),
        )
      ],
    );
  }

  Widget genreBook(double height, double width, String title, String author,
      String price, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => BookPreview(
                    bookTitle: title,
                    authorName: author,
                  )))),
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.4,
              height: height * 0.22,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border:
                      Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
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
        ),
      ),
    );
  }
}
