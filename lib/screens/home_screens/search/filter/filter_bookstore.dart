import 'package:flutter/material.dart';

import 'package:reader_app/shared/exports.dart';

class FilterBookStore extends StatefulWidget {
  final String searchword;
  final String currentPage;
  const FilterBookStore({
    super.key,
    required this.searchword,
    required this.currentPage,
  });

  @override
  State<FilterBookStore> createState() => _FilterBookStoreState();
}

class _FilterBookStoreState extends State<FilterBookStore> {
  List<Book> filteredResults = [];
  Future<List<Book>>? book;
  String token = '';

  @override
  void initState() {
    super.initState();
    _books();
    performSearch(widget.searchword);
  }

  Future<void> getToken() async {
    final person = boxPersons.get('personDetails');

    if (person != null && person is Person) {
      setState(() {
        token = person.token;
      });
    }
  }

// Getting Books
  Future<void> _books() async {
    await getToken();

    List<Book> allBooks = await AllBooks().getBooks(
      token,
      widget.currentPage,
    );

    if (mounted) {
      setState(() {
        book = Future.value(allBooks);
      });
    }
  }

  void performSearch(String searchWord) async {
    if (book == null) {
      filteredResults = [];
      return;
    }
    List<Book>? allBooks = await book;
    filteredResults = allBooks!.where((result) {
      final title = result.title!.toLowerCase();
      final author = result.author!.toLowerCase();
      // final genre = result.genres!;
      final lowercasedSearchWord = searchWord.toLowerCase();
      return title.contains(lowercasedSearchWord) ||
          author.contains(lowercasedSearchWord);
      //  ||
      // genre.contains(lowercasedSearchWord);
    }).toList();
  }

  @override
  void didUpdateWidget(FilterBookStore oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchword != oldWidget.searchword) {
      performSearch(widget.searchword);
      _books();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: InkWell(
              onTap: () => Get.to(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInQuad,
                () => BookPreview(
                  bookTitle: filteredResults[index].title!,
                  authorName: filteredResults[index].author!,
                  desc: filteredResults[index].desc!,
                  genres: filteredResults[index].genres!,
                  price: filteredResults[index].price!,
                  image: filteredResults[index].image!,
                  authorId: filteredResults[index].authorId!,
                  genreIds: filteredResults[index].genreIds!,
                  ratings: filteredResults[index].ratings!,
                  comments: filteredResults[index].comments!,
                  pages: filteredResults[index].pages!,
                ),
              ),
              child: SizedBox(
                height: height * 0.1,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                        width: width * 0.1,
                        height: height * 0.075,
                        imageUrl: filteredResults[index].image!,
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => loader()),
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
            ),
          );
        },
      ),
    );
  }
}
