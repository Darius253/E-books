import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class FilterPage extends StatefulWidget {
  final String? search;
  const FilterPage({
    super.key,
    this.search,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String filterType = 'book';
  int filteredItemsCount = 10;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        header(),
        Center(
          child: Text(
            'Showing result 1 - $filteredItemsCount of $filteredItemsCount',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.10,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(height: height * 0.8, child: booksOrArts(widget.search)),
      ],
    );
  }

  Widget booksOrArts(String? search) {
    if (filterType == 'book') {
      return FilterBookStore(searchword: search!);
    } else {
      return FilterArtStore(
        searchword: search!,
      );
    }
  }

  Widget header() {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtons(
            btext: 'Bookstore',
            bcolor: filterType == 'book' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                filterType = 'book';
              });
            },
            textcolor: filterType == 'book' ? Palette.primary : Colors.grey,
            fsize: 15,
          ),
          Container(
            width: 1,
            height: 26,
            color: Palette.grey,
          ),
          TextButtons(
            btext: 'Art Store',
            bcolor: filterType == 'art' ? Palette.primary : Colors.transparent,
            onTap: () {
              setState(() {
                filterType = 'art';
              });
            },
            textcolor: filterType == 'art' ? Palette.primary : Colors.grey,
            fsize: 15,
          ),
        ],
      ),
    );
  }
}
