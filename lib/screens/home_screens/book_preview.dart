import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/authenticate/signin/widgets/button.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.07, vertical: height * 0.025),
          child: Stack(
            children: [
              appBar(width, bookTitle),
              Padding(
                padding: EdgeInsets.only(top: height * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
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
                      bookInfo(width, height, bookTitle),
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
                      SizedBox(
                        height: height * 0.05,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return relatedGenres(width, height, genre[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: width * 0.025,
                              );
                            },
                            itemCount: genre.length),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      button(
                        height,
                        '89.99',
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      const Text(
                        'Comments',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
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
                                width: width * 0.025,
                              );
                            },
                            itemCount: genre.length),
                      ),
                      SizedBox(
                        height: height * 0.045,
                      ),
                      const Text(
                        'Related Books',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
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
                                width: width * 0.025,
                              );
                            },
                            itemCount: genre.length),
                      ),
                      SizedBox(
                        height: height * 0.045,
                      ),
                      const Text(
                        'Other books by the author',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
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
                                width: width * 0.025,
                              );
                            },
                            itemCount: genre.length),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookCover(double width, height) {
    return Container(
      width: width * 0.3,
      height: height * 0.2,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget appBar(double width, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(249, 41, 45, 50),
            size: width * 0.06,
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            CupertinoIcons.share,
            color: Colors.black,
            size: width * 0.06,
          ),
        ),
        const SizedBox(
          width: 0.0,
        ),
        InkWell(
          onTap: () {},
          child: Icon(
            CupertinoIcons.info_circle,
            color: Colors.black,
            size: width * 0.06,
          ),
        ),
      ],
    );
  }

  Widget relatedGenres(double width, height, String genre) {
    return Container(
      width: width * 0.25,
      height: height * 0.03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: Text(genre),
      ),
    );
  }

  Widget commentsCard(double width, height) {
    return Container(
      width: width * 0.7,
      height: height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 140, 63, 4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            'Fantastic',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            'I love this book. I recommend it to everyone. It’s fantastic. I like the suspence and ',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            'Fantastic',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget bookInfo(double width, height, String title) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Text(
            'Darius Tron',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                '7000 ratings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  const Text(
                    '5.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    size: width * 0.03,
                    color: const Color.fromARGB(244, 255, 217, 0),
                  )
                ],
              ),
              const Text(
                '74 Comments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget button(double height, String text) {
    return GestureDetector(
      onTap: () {
        print(text);
      },
      child: Container(
        height: height * 0.08,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 112, 23),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 123, 64, 0.35),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          'Pay GHS $text',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
