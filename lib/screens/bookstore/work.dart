import 'package:flutter/material.dart';
import 'package:reader_app/screens/bookstore/genre_chips.dart';
import 'package:reader_app/shared/exports.dart';

class WorkBookStore extends StatelessWidget {
  const WorkBookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Text(
                "BookStore",
                style: TextStyle(
                    color: Palette.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              GenreChips(),
            ],
          ),
        ],
      ),
    ));
  }
}