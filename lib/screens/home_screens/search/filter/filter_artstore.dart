import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:reader_app/shared/exports.dart';

class FilterArtStore extends StatefulWidget {
  final String searchword;
  const FilterArtStore({super.key, required this.searchword});

  @override
  State<FilterArtStore> createState() => _FilterArtStoreState();
}

class _FilterArtStoreState extends State<FilterArtStore> {
  List<Art> filteredResults = [];

  @override
  void initState() {
    super.initState();
    performSearch(widget.searchword);
  }

  void performSearch(String searchWord) {
    filteredResults = arts.where((result) {
      final title = result.title.toLowerCase();
      final artist = result.artist.toLowerCase();
      final desc = result.gallery!.toLowerCase();
      final lowercasedSearchWord = searchWord.toLowerCase();
      return title.contains(lowercasedSearchWord) ||
          artist.contains(lowercasedSearchWord) ||
          desc.contains(lowercasedSearchWord);
    }).toList();
  }

  @override
  void didUpdateWidget(FilterArtStore oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchword != oldWidget.searchword) {
      performSearch(widget.searchword);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(bottom:height*0.175),
        child: SizedBox(
          height: height,
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
            itemCount: filteredResults.length,
            itemBuilder: (context, index) {
              return art(
                  width,
                 Random().nextInt(150) + 50.5,
                  filteredResults[index].artist,
                  filteredResults[index].title,
                  filteredResults[index].gallery,
                  filteredResults[index].price,
                  14,
                  context);
            },
          ),
        ),
      ),
    );
  }
}
