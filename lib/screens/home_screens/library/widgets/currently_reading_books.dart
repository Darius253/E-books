import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CurrentlyReadingBooks extends StatelessWidget {
  final Book book;
  const CurrentlyReadingBooks({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: height * 0.1,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                book.image,
                width: width,
                fit: BoxFit.fitWidth,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(book.image),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          book.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'by ${book.author}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          width: width * 0.5,
                          animation: true,
                          percent: 0.5,
                          animationDuration: 2500,
                          backgroundColor: Colors.grey,
                          progressColor: const Color(0xFFFFD700),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
