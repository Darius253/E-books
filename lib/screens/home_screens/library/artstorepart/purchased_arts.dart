import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reader_app/shared/exports.dart';

class PurchasedArts extends StatelessWidget {
  const PurchasedArts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      mainAxisSpacing: 16,
      crossAxisSpacing: 5,
      itemCount: arts.length,
      itemBuilder: (BuildContext context, int index) {
        return art(
            width,
            Random().nextInt(150) + 50.5,
            arts[index].artist,
            arts[index].title,
            arts[index].gallery,
            arts[index].price,
            14,
            context);
      },
    );
  }
}
