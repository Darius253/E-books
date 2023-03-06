import 'package:flutter/material.dart';
import '../../shared/exports.dart';

class BookPreview extends StatelessWidget {
  final String bookTitle;
  const BookPreview({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    List<String> genre = ['Romance', 'Adventure', 'Mystery'];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            appBar(width, height, bookTitle),
            Padding(
              padding: EdgeInsets.only(top: height * 0.075),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: width * 0.7,
                              height: height * 0.4,
                              decoration: BoxDecoration(
                                  // image: DecorationImage(image: image),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          bookInfo(
                            width,
                            height,
                            bookTitle,
                            'Darius Tron',
                            () => Get.to(const AuthorPreview(
                              authorName: 'Darius Tron',
                            )),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Book Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'The star of truTV’s hit show Impractical Jokers - alongside veteran sci-fi and horror writer Darren Wearmouth - delivers a chilling and wickedly fun supernatural novel in the vein of The Strain, in which a beautiful new subway line in New York City unearths an ancient dark horror that threatens the city’s utter destruction and the balance of civilization itself... read more',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: SizedBox(
                              height: height * 0.05,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return relatedGenres(
                                        width, height, genre[index]);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: width * 0.025,
                                    );
                                  },
                                  itemCount: genre.length),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          button(
                            height,
                            '89.99',
                          )
                        ]),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      booksType(width, 'Comments'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return commentsCard(width, height);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: width * 0.00,
                              );
                            },
                            itemCount: genre.length),
                      ),
                      SizedBox(
                        height: height * 0.045,
                      ),
                      booksType(width, 'Related Books'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return bookCover(width, height);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: width * 0,
                              );
                            },
                            itemCount: genre.length),
                      ),
                      SizedBox(
                        height: height * 0.045,
                      ),
                      booksType(width, 'Other books by the author'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return bookCover(width, height);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: width * 0.000,
                              );
                            },
                            itemCount: genre.length),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}