import 'package:flutter/material.dart';
import 'package:reader_app/screens/search/search_tags.dart';

class FilterBookStore extends StatefulWidget {
  final String searchword;
  const FilterBookStore({super.key, required this.searchword});

  @override
  State<FilterBookStore> createState() => _FilterBookStoreState();
}

class _FilterBookStoreState extends State<FilterBookStore> {
  List<TagData> filteredResults = [];

  @override
  void initState() {
    super.initState();
    filteredResults = texts
        .where((result) =>
            result.text.toLowerCase().contains(widget.searchword.toLowerCase()))
        .toList();
  }

  String filterType = 'book';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredResults[index].text),
          );
        },
      ),
    );
  }
}