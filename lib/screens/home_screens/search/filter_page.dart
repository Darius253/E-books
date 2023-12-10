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
  String token = '';
  Future<List<Book>>? book;
  int currentPage = 1;
  Future<int>? lastPage;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _books();
    _getLastPage();
  }

  Future<void> _getLastPage() async {
    int page = await AllBooks().getAllBooksLastPage(token);
    if (mounted) {
      setState(() {
        lastPage = Future.value(page);
      });
    }
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
      currentPage.toString(),
    );

    if (mounted) {
      setState(() {
        book = Future.value(allBooks);
      });
    }
  }

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
        FutureBuilder<int>(
            future: lastPage,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loader();
              } else if (snapshot.hasData && snapshot.data != null) {
                return loading == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'Showing result ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          changePage(
                            height,
                            150,
                            currentPage,
                            snapshot.data!,
                            () {
                              _books();
                              setState(() {
                                loading = true;
                                currentPage -= 1;
                              });

                              Future.delayed(const Duration(seconds: 5), () {
                                setState(() {
                                  loading = false;
                                });
                              });
                            },
                            () {
                              _books();
                              setState(() {
                                loading = true;
                                currentPage += 1;
                              });

                              Future.delayed(const Duration(seconds: 5), () {
                                setState(() {
                                  loading = false;
                                });
                              });
                            },
                          )
                        ],
                      )
                    : const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Palette.primary,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const SizedBox.shrink();
              }
            }),
        
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: height ,
            child: booksOrArts(widget.search, 1)),
      ],
    );
  }

  Widget booksOrArts(String? search, int currentPage) {
    if (filterType == 'book') {
      return FilterBookStore(
        searchword: search!,
        currentPage: currentPage.toString(),
      );
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
