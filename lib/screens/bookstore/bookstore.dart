import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';


class BookStore extends StatefulWidget {
  const BookStore({super.key});

  @override
  _BookStoreState createState() => _BookStoreState();
}

class _BookStoreState extends State<BookStore> {
  String genrePage = 'all';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const SizedBox(
                height: 8,
              ),
              //Trending books
              const Text(
                'Trending Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 6,
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
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 195,
                          width: 150,
                          child: Image.asset(
                            books.imageUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(books.title, style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(books.price, style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w400,
                        ),)
                      ],
                    ),
                  );
                },
              ),
        
              // Popular Books
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Popular Books',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                      height: 130,
                      viewportFraction: .30,
                      enableInfiniteScroll: true),
                  itemCount: book.length,
                  itemBuilder: (BuildContext context, int index, int pageViewIndex) {
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
