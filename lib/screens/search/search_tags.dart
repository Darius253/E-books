import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SearchTags extends StatelessWidget {
  final List<TagData> texts;
  const SearchTags({super.key, required this.texts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: texts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 70, mainAxisSpacing: 8
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 4),
          ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Palette.color4,
            child: Center(
              child: Text(
                texts[index].text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Palette.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TagData {
  final String text;

  TagData(this.text);
}

List<TagData> texts = [
  TagData('Editor’s Pick'),
  TagData('Trending'),
  TagData('Adventure'),
  TagData('Fantasy'),
  TagData('Horror'),
  TagData('FanFiction'),
  TagData('The Wattys'),
  TagData('Romance'),
  TagData('Poetry'),
  TagData('Thriller'),
  TagData('Werewolf'),
  TagData('Science Fiction'),
];
