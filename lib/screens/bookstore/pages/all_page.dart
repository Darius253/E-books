import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  String genrePage = 'all';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              //Trending books
              const Text(
                'Trending Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: height * 0.35,
                    viewportFraction: .45,
                    enableInfiniteScroll: true),
                itemCount: book.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  Book books = book[index];
                  return SizedBox(
                    width: width * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          books.imageUrl,
                          fit: BoxFit.fitWidth,
                          height: height * 0.3,
                          width: width * 0.9,
                        ),
                        Text(
                          books.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          books.price,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

              // Popular Books
              SizedBox(
                height: height * 0.013,
              ),
              const Text(
                'Popular Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 130,
                      viewportFraction: .30,
                      enableInfiniteScroll: true),
                  itemCount: book.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
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
              const SizedBox(
                height: 10,
              ),

              // Most Read this week
              const Text(
                'Most Read this week',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 130,
                      viewportFraction: .30,
                      enableInfiniteScroll: true),
                  itemCount: book.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
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

              const SizedBox(
                height: 8,
              ),

              // Bestsellers Books
              const Text(
                'Bestsellers Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 130,
                      viewportFraction: .30,
                      enableInfiniteScroll: true),
                  itemCount: book.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
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

              const SizedBox(
                height: 8,
              ),

              // Newly Added Books
              const Text(
                'Newly Added Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                      height: 130,
                      viewportFraction: .30,
                      enableInfiniteScroll: true),
                  itemCount: book.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
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
            ],
          ),
        ),
      ),
    );
  }
}
