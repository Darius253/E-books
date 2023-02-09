import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:reader_app/widgets/genre_button.dart';

class HeaderPart extends StatefulWidget {
  const HeaderPart({super.key});

  @override
  State<HeaderPart> createState() => _HeaderPartState();
}

class _HeaderPartState extends State<HeaderPart> {
  String genrePage = 'all';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BookStore',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          SizedBox(
            height: 8,
          ),
          switchButtons(),

          Expanded(child: chipSwitch(genrePage)),
        ],
      ),
    );
  }

  Widget chipSwitch(String genrePage) {
    Widget result;
    switch (genrePage) {
      case 'all':
        result = BookStore();
        break;
      case 'comedy':
        result = ComedyPage();
        break;
      case 'fiction':
        result = FictionPage();
        break;
      case 'nonfiction':
        result = NonFictionPage();
        break;
      case 'mystery':
        result = MysteryPage();
        break;
      case 'adventure':
        result = AdventurePage();
        break;
      case 'romance':
        result = RomancePage();
        break;
      case 'poetry':
        result = PoetryPage();
        break;
      case 'acts':
        result = ActsPage();
        break;
      case 'science':
        result = SciencePage();
        break;
      case 'sports':
        result = SportsPage();
        break;
      case 'crime':
        result = CrimePage();
        break;
      default:
        result = BookStore();
        break;
    }
    return result;
  }

  Widget switchButtons(){
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GenreButton(onTap: () { 
            setState(() {
              genrePage = 'all';
            });
           }, text: 'All', 
           bcolor: genrePage == 'all' ? Palette.primary : Colors.transparent, 
           brcolor: genrePage == 'all' ? Colors.transparent : Palette.grey, 
           textcolor: genrePage == 'all' ? Colors.white : Palette.grey, ),

           GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'comedy';
              });
            },
            text: 'comedy',
            bcolor: genrePage == 'comedy' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'comedy' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'comedy' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'fiction';
              });
            },
            text: 'fiction',
            bcolor: genrePage == 'fiction' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'fiction' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'fiction' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'nonfiction';
              });
            },
            text: 'nonfiction',
            bcolor: genrePage == 'nonfiction' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'nonfiction' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'nonfiction' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'mystery';
              });
            },
            text: 'mystery',
            bcolor: genrePage == 'mystery' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'mystery' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'mystery' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'adventure';
              });
            },
            text: 'adventure',
            bcolor: genrePage == 'adventure' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'adventure' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'adventure' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'romance';
              });
            },
            text: 'romance',
            bcolor: genrePage == 'romance' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'romance' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'romance' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'poetry';
              });
            },
            text: 'poetry',
            bcolor: genrePage == 'poetry' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'poetry' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'poetry' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'acts';
              });
            },
            text: 'acts',
            bcolor: genrePage == 'acts' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'acts' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'acts' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'science';
              });
            },
            text: 'science',
            bcolor: genrePage == 'science' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'science' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'science' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'sports';
              });
            },
            text: 'sports',
            bcolor: genrePage == 'sports' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'sports' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'sports' ? Colors.white : Palette.grey,
          ),

          GenreButton(
            onTap: () {
              setState(() {
                genrePage = 'crime';
              });
            },
            text: 'crime',
            bcolor:
                genrePage == 'crime' ? Palette.primary : Colors.transparent,
            brcolor: genrePage == 'crime' ? Colors.transparent : Palette.grey,
            textcolor: genrePage == 'crime' ? Colors.white : Palette.grey,
          ),
        ],
      ),
    );
  }
}
