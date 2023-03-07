import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class SwitchButtons extends StatefulWidget {
   const SwitchButtons({super.key});

  @override
  State<SwitchButtons> createState() => _SwitchButtonsState();
}

class _SwitchButtonsState extends State<SwitchButtons> {
  @override
  Widget build(BuildContext context) {
    String genrePage = 'all';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'all';
                });
              },
              text: 'All',
              bcolor: genrePage == 'all' ? Palette.primary : Colors.transparent,
              brcolor: genrePage == 'all' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'all' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'comedy';
                });
              },
              text: 'Comedy',
              bcolor:
                  genrePage == 'comedy' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'comedy' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'comedy' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'fiction';
                });
              },
              text: 'Fiction',
              bcolor:
                  genrePage == 'fiction' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'fiction' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'fiction' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'nonfiction';
                });
              },
              text: 'Non-Fiction',
              bcolor: genrePage == 'nonfiction'
                  ? Palette.primary
                  : Colors.transparent,
              brcolor:
                  genrePage == 'nonfiction' ? Colors.transparent : Palette.grey,
              textcolor:
                  genrePage == 'nonfiction' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'mystery';
                });
              },
              text: 'Mystery',
              bcolor:
                  genrePage == 'mystery' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'mystery' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'mystery' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'adventure';
                });
              },
              text: 'Adventure',
              bcolor: genrePage == 'adventure'
                  ? Palette.primary
                  : Colors.transparent,
              brcolor:
                  genrePage == 'adventure' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'adventure' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'romance';
                });
              },
              text: 'Romance',
              bcolor:
                  genrePage == 'romance' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'romance' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'romance' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'poetry';
                });
              },
              text: 'Poetry',
              bcolor:
                  genrePage == 'poetry' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'poetry' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'poetry' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'acts';
                });
              },
              text: 'Acts',
              bcolor:
                  genrePage == 'acts' ? Palette.primary : Colors.transparent,
              brcolor: genrePage == 'acts' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'acts' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'science';
                });
              },
              text: 'Science',
              bcolor:
                  genrePage == 'science' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'science' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'science' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'sports';
                });
              },
              text: 'Sports',
              bcolor:
                  genrePage == 'sports' ? Palette.primary : Colors.transparent,
              brcolor:
                  genrePage == 'sports' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'sports' ? Colors.white : Palette.grey,
            ),
            GenreButton(
              onTap: () {
                setState(() {
                  genrePage = 'crime';
                });
              },
              text: 'Crime',
              bcolor:
                  genrePage == 'crime' ? Palette.primary : Colors.transparent,
              brcolor: genrePage == 'crime' ? Colors.transparent : Palette.grey,
              textcolor: genrePage == 'crime' ? Colors.white : Palette.grey,
            ),
          ],
        ),
      ),
    );
  }
}