import 'package:flutter/material.dart';
import 'package:reader_app/screens/search/filter/filter_artstore.dart';
import 'package:reader_app/screens/search/filter/filter_bookstore.dart';
import 'package:reader_app/shared/exports.dart';
import 'package:reader_app/widgets/text_buttons.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key,});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String filterType = 'book';
  int filteredItemsCount = 10;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8,),
            bookStoreORartStoreButtons(),
            Text(
                "Showing results 1 - $filteredItemsCount of $filteredItemsCount", style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400
                ),),
                const SizedBox(
              height: 10,
            ),
            Expanded(child: bookStoreOrArtStore()),
          ],
        ),
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
            textcolor: filterType == 'book' ? Palette.primary : Colors.grey, fsize: 15,
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
            textcolor: filterType == 'art' ?  Palette.primary : Colors.grey, fsize: 15,
          ),
        ],
      ),
    );
  }
}