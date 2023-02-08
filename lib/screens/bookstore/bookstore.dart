import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';


class BookStore extends StatefulWidget {
  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 115,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'BookStore',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GenreChips(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Trending books
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Trending Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                  height: 250,
                  viewportFraction: .40,
                  enableInfiniteScroll: true),
              itemCount: book.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                Book books = book[index];
                return SizedBox(
                  width: 155,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        child: Image.asset(
                          books.imageUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(books.title),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(books.price)
                    ],
                  ),
                );
              },
            ),

            // Popular Books
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Popular Books',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    Book books = book[index];
                    return SizedBox(
                      width: 150,
                      height: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            width: 100,
                            child: Image.asset(
                              books.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),

            // Most Read this week
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Most Read this week',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (BuildContext context, int index) {
                    Book books = book[index];
                    return Container(
                      width: 150,
                      height: 210,
                      //  color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            width: 100,
                            child: Image.asset(
                              books.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),

const SizedBox(
              height: 8,
            ),

            // Bestsellers Books
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Bestsellers Books',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (BuildContext context, int index) {
                    Book books = book[index];
                    return SizedBox(
                      width: 150,
                      height: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 130,
                            width: 100,
                            child: Image.asset(
                              books.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),

const SizedBox(
              height: 8,
            ),
            // Newly Added Books
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                'Newly Added Books',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (BuildContext context, int index) {
                    Book books = book[index];
                    return SizedBox(
                      width: 150,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 130,
                            width: 100,
                            child: Image.asset(
                              books.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
