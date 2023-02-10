import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SearchTags extends StatelessWidget {
  final List<TagData> texts;
  const SearchTags({super.key, required this.texts});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: texts.length,
      shrinkWrap: true,
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        ),
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Align(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Palette.color4,
                ),
                child: Center(
                  child: Text(texts[index].text, style: const TextStyle(
                    fontSize: 15,
                    color: Palette.black,
                  ),),
                ),
              ),
            ),
          );
        });
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
