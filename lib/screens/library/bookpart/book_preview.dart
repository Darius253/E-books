import 'package:flutter/material.dart';
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
          actions: [
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
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}
