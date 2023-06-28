import 'package:flutter/material.dart';

import 'package:reader_app/shared/exports.dart';


class FilterBookStore extends StatefulWidget {
  final String searchword;
  const FilterBookStore({super.key, required this.searchword});

  @override
  State<FilterBookStore> createState() => _FilterBookStoreState();
}

class _FilterBookStoreState extends State<FilterBookStore> {
  List<Book> filteredResults = [];

  @override
  void initState() {
    super.initState();
    performSearch(widget.searchword);
  }

  void performSearch(String searchWord) {
    filteredResults = book.where((result) {
      final title = result.title.toLowerCase();
      final author = result.author.toLowerCase();
      final genre = result.genre.toLowerCase();
      final lowercasedSearchWord = searchWord.toLowerCase();
      return title.contains(lowercasedSearchWord) ||
          author.contains(lowercasedSearchWord) ||
          genre.contains(lowercasedSearchWord);
    }).toList();
  }

  @override
  void didUpdateWidget(FilterBookStore oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchword != oldWidget.searchword) {
      performSearch(widget.searchword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 26.0),
            child: InkWell(
              onTap: () => Get.to(
                () => BookPreview(
                  bookTitle: filteredResults[index].title,
                  authorName: filteredResults[index].author,
                ),
              ),
              child: ListTile(
                leading: Image.asset(
                  filteredResults[index].image,
                  width: 60,
                ),
                title: Text(
                  '${filteredResults[index].title}\nby ${filteredResults[index].author}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
