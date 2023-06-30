import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reader_app/shared/exports.dart';

class PurchasedBooks extends StatelessWidget {
  const PurchasedBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      mainAxisSpacing: 16,
      crossAxisSpacing: 5,
      itemCount: book.length,
      itemBuilder: (BuildContext context, int index) {
        return books(
            width,
            Random().nextInt(150) + 50.5,
            book[index].author,
            book[index].title,
            book[index].genre,
            book[index].price,
            14,
            context);
      },
    );
  }
}
