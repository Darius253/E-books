import 'package:flutter/material.dart';

class SearchTags extends StatelessWidget {
  const SearchTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'Editor’s Pick',
      'Trending',
      'Adventure',
      'Fantasy',
      'Horror',
      'FanFiction',
      'The Wattys',
      'Romance',
      'Poetry',
      'Thriller',
      'Werewolf',
      'Science Fiction',
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: GridView.builder(
        itemCount: texts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 60, crossAxisSpacing: 40, mainAxisSpacing: 30),
        itemBuilder: (context, index) {
          return Container(
            decoration: ShapeDecoration(
              color: const Color(0xFFFAD9C2),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: Center(
              child: Text(
                texts[index],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
