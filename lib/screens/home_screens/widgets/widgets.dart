import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

Widget bookCover(double width, height) {
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.07,
    ),
    child: Container(
      width: width * 0.3,
      height: height * 0.2,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 123, 64, 0.35),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
          border: Border.all(color: const Color.fromARGB(255, 140, 63, 4)),
          borderRadius: BorderRadius.circular(8)),
    ),
  );
}

Widget booksType(double width, String type) {
  return Padding(
      padding: EdgeInsets.only(
        left: width * 0.07,
      ),
      child: Text(
        type,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ));
}

Widget appBar(double width, height, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: width * 0.07, vertical: height * 0.025),
    child: Row(
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
              fontSize: 18,
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
    ),
  );
}

Widget relatedGenres(double width, height, String genre) {
  return Container(
    width: width * 0.2,
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
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.07,
    ),
    child: Container(
      width: width * 0.75,
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
    ),
  );
}

Widget bookInfo(double width, height, String title, author, Function()? ontap) {
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
        InkWell(
          onTap: ontap,
          child: Text(
            author,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
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
