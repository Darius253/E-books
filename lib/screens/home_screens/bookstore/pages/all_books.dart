import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.015,
            ),
            //Trending books
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Trending Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: book.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  Book books = book[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        books.imageUrl,
                        fit: BoxFit.fill,
                        height: height * 0.35,
                        width: width * 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          books.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          books.price,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),

            // Popular Books
            SizedBox(
              height: height * 0.013,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Popular Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    Book books = book[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.210,
                          child: Image.asset(
                            books.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),

            // Most Read this week
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Most Read this week',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: height * 0.210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    Book books = book[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.210,
                          child: Image.asset(
                            books.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            const SizedBox(
              height: 8,
            ),

            // Bestsellers Books
            const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text(
                'Bestsellers Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: height * 0.210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    Book books = book[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.210,
                          child: Image.asset(
                            books.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            const SizedBox(
              height: 8,
            ),

            // Newly Added Books
            const Padding(
              padding: EdgeInsets.only(left:8.0),
              child: Text(
                'Newly Added Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: height * 0.210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: book.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    Book books = book[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.210,
                          child: Image.asset(
                            books.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
