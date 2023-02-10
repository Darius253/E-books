import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/search/filter_page.dart';
import 'package:reader_app/shared/exports.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Palette.primary,
      middle: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: CupertinoSearchTextField(
          onSubmitted: (value) {
            
          },
          prefixIcon: const Icon(
            CupertinoIcons.search,
            size: 16,
          ),
          backgroundColor: Palette.white,
          borderRadius: BorderRadius.circular(13),
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 71, 71, 71)),
          placeholder: 'Title, author, or artist',
          placeholderStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Palette.grey),
        ),
      ),
    );
  }
}