import 'package:flutter/material.dart';
import 'package:reader_app/screens/search/search_tags.dart';
import 'package:reader_app/shared/exports.dart';

class FilterBookStore extends StatefulWidget {
  final String searchword;
  const FilterBookStore({super.key, required this.searchword});

  @override
  State<FilterBookStore> createState() => _FilterBookStoreState();
}

class _FilterBookStoreState extends State<FilterBookStore> {
  List<BookInfoData> filteredResults = [];

  @override
  void initState() {
    super.initState();
    filteredResults = infodata
        .where((result) =>
            result.title
            .toLowerCase().contains(widget.searchword.toLowerCase()))
        .toList();
  }

  String filterType = 'book';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(9),
            child: ListTile(
              leading: Image.asset(filteredResults[index].image),
              title: Text('${filteredResults[index].title}\n by ${filteredResults[index].author}' , style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
            ),
          );
        },
      ),
    );
  }
}