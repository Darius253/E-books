import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookPreview extends StatelessWidget {
  final String bookTitle;
  final String authorName;
  const BookPreview({
    super.key,
    required this.bookTitle,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    List<String> genre = ['Romance', 'Adventure', 'Mystery'];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            appBar(width, height, bookTitle, true),
            Padding(
              padding: EdgeInsets.only(top: height * 0.075),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            authorName,
                            () => Get.to(AuthorPreview(
                              authorName: authorName,
                            )),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Text(
                            'Rate this book:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.10,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemBuilder: (context, _) => Icon(
                              PhosphorIcons.fill.star,
                              color: const Color.fromARGB(255, 255, 217, 0),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Book Description',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
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
                          button(height, '89.99', bookTitle, authorName)
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
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return commentsCard(width, height);
                            },
                            itemCount: genre.length),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () => Get.to(() => const ReviewPage()),
                          child: const Text(
                            'Leave a review',
                            style: TextStyle(
                              color: Color(0xFF8C3E04),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
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
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return bookCover(width, height);
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
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return bookCover(width, height);
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
