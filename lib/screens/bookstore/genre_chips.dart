import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class GenreChips extends StatefulWidget {
  const GenreChips({super.key});

  @override
  State<GenreChips> createState() => _GenreChipsState();
}

class _GenreChipsState extends State<GenreChips> {
  @override
  Widget build(BuildContext context) {
    int? selectedIndex;
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ChoiceChip(
            selected: selectedIndex == 1,
            onSelected: (selected) {
              setState(() {
                selectedIndex = 1;
              });
              Get.off(() => BookStore());
            },
            padding: const EdgeInsets.all(8),
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('All'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 2,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 2;
              });
              Get.off(() => const ComedyPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text("Comedy"),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 3,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 3;
              });
              Get.off(const FictionPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Fiction'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 4,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 4;
              });
              Get.off(const NonFictionPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Non-Fiction'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 5,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 5;
              });
              Get.off(const MysteryPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Mystery'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 6,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 6;
              });
              Get.off(const AdventurePage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Adventure'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 7,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 7;
              });
              Get.off(const RomancePage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Romance'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 8,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 8;
              });
              Get.off(const PoetryPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Poetry'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 9,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 9;
              });
              Get.off(const ActsPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Acts'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 10,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 10;
              });
              Get.off(const SciencePage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Science'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 11,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 11;
              });
              Get.off(const SportsPage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Sports'),
          ),
          const SizedBox(
            width: 8,
          ),
          ChoiceChip(
            selected: selectedIndex == 12,
            padding: const EdgeInsets.all(8),
            onSelected: (selected) {
              setState(() {
                selectedIndex = 12;
              });
              Get.off(const CrimePage());
            },
            side: const BorderSide(color: Palette.grey),
            selectedColor: Palette.primary,
            backgroundColor: Colors.transparent,
            label: const Text('Crime'),
          ),
        ],
      ),
    );
  }
}
