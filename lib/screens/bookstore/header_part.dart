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
    //final double height = MediaQuery.of(context).size.height;
    //final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 6,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'BookStore',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 3,
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
        result = const ComedyPage();
        break;
      case 'fiction':
        result = const FictionPage();
        break;
      case 'nonfiction':
        result = const NonFictionPage();
        break;
      case 'mystery':
        result = const MysteryPage();
        break;
      case 'adventure':
        result = const AdventurePage();
        break;
      case 'romance':
        result = const RomancePage();
        break;
      case 'poetry':
        result = const PoetryPage();
        break;
      case 'acts':
        result = const ActsPage();
        break;
      case 'science':
        result = const SciencePage();
        break;
      case 'sports':
        result = const SportsPage();
        break;
      case 'crime':
        result = const CrimePage();
        break;
      default:
        result = BookStore();
        break;
    }
    return result;
  }

  Widget switchButtons(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 40,
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
              text: 'Comedy',
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
              text: 'Fiction',
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
              text: 'Non-Fiction',
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
              text: 'Mystery',
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
              text: 'Adventure',
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
              text: 'Romance',
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
              text: 'Poetry',
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
              text: 'Acts',
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
              text: 'Science',
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
              text: 'Sports',
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
