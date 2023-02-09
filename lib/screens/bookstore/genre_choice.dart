import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class GenreChoice extends StatefulWidget {
  const GenreChoice({super.key});

  @override
  State<GenreChoice> createState() => _GenreChoiceState();
}

class _GenreChoiceState extends State<GenreChoice> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 5.0,
        children: choiceChips(),
      ),
    );
  }

List<Widget> choiceChips() {
    int? selectedIndex;
    List<Widget> chips = [];
    for (int i = 0; i < cdatalist.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.all(2),
        child: ChoiceChip(
          label: Text(cdatalist[i].label),
          side: const BorderSide(color: Palette.grey),
          labelStyle: const TextStyle(color: Palette.grey),
          backgroundColor: Colors.transparent,
          selected: selectedIndex == i,
          selectedColor: Palette.primary,
          onSelected: (bool value) {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

class CData {
  String label;

  CData(this.label);
}

final List<CData> cdatalist = [
   CData('All'),
   CData('Comedy'),
   CData('Fiction'),
   CData('Non-Fiction'),
   CData('Mystery'),
   CData('Adventure'),
   CData('Romance'),
   CData('Poetry'),
   CData('Acts'),
   CData('Science'),
   CData('Sports'),
   CData('Crime'),
];


