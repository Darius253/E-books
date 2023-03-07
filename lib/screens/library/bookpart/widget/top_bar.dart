import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class TopBar extends StatefulWidget {
  final String bookTitle;

  const TopBar({super.key, required this.bookTitle});
  

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        title:  Text(
          widget.bookTitle,
          style: const TextStyle(fontSize: 16, color: Palette.black),
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
              CupertinoIcons.exclamationmark_circle,
              color: Palette.black,
              size: 20,
            ),
          ),
        ]);
  }
}
