
import 'package:flutter/material.dart';
import 'package:reader_app/screens/search/search_tags.dart';

class FilterArtStore extends StatefulWidget {
  final String searchword;
  const FilterArtStore({super.key, required this.searchword});

  @override
  State<FilterArtStore> createState() => _FilterArtStoreState();
}

class _FilterArtStoreState extends State<FilterArtStore> {
  List<TagData> filteredResults = [];
  @override
  void initState() {
    super.initState();
    filteredResults = texts
        .where((result) =>
            result.text.toLowerCase().contains(widget.searchword.toLowerCase()))
        .toList();
  }

  String filterType = 'art';
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