import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:reader_app/screens/library/bookpart/widget/book_text.dart';
import 'package:reader_app/shared/exports.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        title: const Text(
          'The Perfect Marriage',
          style: TextStyle(fontSize: 16, color: Palette.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Palette.black,
            size: 18,
          ),
        ),
        actions:
         [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.ios_share_outlined,
              color: Palette.black,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.circle_outlined,
              color: Palette.black,
              size: 20,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 190,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(height: height * 0.01,),
              const Text(
                'The Perfect Marriage',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                'Jeneva Rose >',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Book Description',
                  style: TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.red),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                width: width * 0.90,
                height: height * 0.40,
                child: const SingleChildScrollView(child: BookDesc()),),
                

            ],
          ),
        ),
      ),
    ));
  }
}
