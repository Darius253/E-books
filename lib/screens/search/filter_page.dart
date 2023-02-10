import 'package:flutter/material.dart';
import 'package:reader_app/screens/search/filter/filter_artstore.dart';
import 'package:reader_app/screens/search/filter/filter_bookstore.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:reader_app/widgets/text_buttons.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String filterType = 'book';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          bookStoreORartStoreButtons(),
          bookStoreOrArtStore(),
        ],
      ),
    );
  }



Widget bookStoreOrArtStore() {
  if(filterType == 'book'){
    return const FilterBookStore(searchword: '');
  } else {
    return const FilterArtStore(searchword: '',);
  }
}

Widget bookStoreORartStoreButtons() {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtons(
            btext: 'Bookstore',
            // bbackgroundColor:
            //     accountType == 'creator' ? Palette.primary : Colors.transparent,
            bcolor:
                filterType == 'book' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                filterType = 'book';
              });
            },
            textcolor: filterType == 'book' ? Palette.primary : Colors.grey,
          ),
          Container(
            width: 1,
            height: 26,
            color: Palette.grey,
          ),
          TextButtons(
            btext: 'Art Store',
            //bbackgroundColor: filterType == 'customer' ? Palette.primary : Colors.transparent,
            bcolor: filterType == 'art'
                ? Palette.primary
                : Colors.transparent,
            onTap: () {
              setState(() {
                filterType = 'art';
              });
            },
            textcolor: filterType == 'art' ? Colors.grey : Palette.primary,
          ),
        ],
      ),
    );
  }
}