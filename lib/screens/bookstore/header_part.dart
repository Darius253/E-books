import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

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
          const GenreChips(),

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
        result = Text("Page Not Found");
        break;
    }
    return result;
  }
}
