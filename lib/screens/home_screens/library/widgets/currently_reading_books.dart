import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class CurrentlyReadingBooks extends StatefulWidget {
  final Book book;
  const CurrentlyReadingBooks({super.key, required this.book});

  @override
  State<CurrentlyReadingBooks> createState() => _CurrentlyReadingBooksState();
}

class _CurrentlyReadingBooksState extends State<CurrentlyReadingBooks>
    with TickerProviderStateMixin {
  //late AnimationController controller;

  @override
  // void initState() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 5),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: true);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

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
                widget.book.image,
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
                      image: AssetImage(widget.book.image),
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
                          widget.book.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'by ${widget.book.author}',
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
                          width: 150,
                          percent: 0.5,
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
