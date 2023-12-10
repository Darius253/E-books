import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookPage extends StatefulWidget {
  final String genre;
  final int genreId;
  const BookPage({
    Key? key,
    required this.genre,
    required this.genreId,
  }) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with AutomaticKeepAliveClientMixin<BookPage> {
  @override
  bool get wantKeepAlive => true;

  String token = '';
  int currentPage = 1;
  bool loading = false;

  @override
  void didUpdateWidget(covariant BookPage oldWidget) {
    if (oldWidget.genreId != widget.genreId) {
      _fetchBooks();
      _getLastPage();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    _fetchBooks();
    _getLastPage();
  }

  Future<void> getToken() async {
    final person = boxPersons.get('personDetails');

    if (person != null && person is Person) {
      setState(() {
        token = person.token;
      });
    }
  }

  // fetch lastPages
  Future<int> _getLastPage() async {
    int page = await FavGenreBooks().getLastPage(token, widget.genreId);
    return page;
  }

//fetching books
  Future<List<Book>> _fetchBooks() async {
    await getToken();

    List<Book> fetchedBooks = await FavGenreBooks()
        .getfavBooks(token, widget.genreId, currentPage.toString());
    return fetchedBooks;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  widget.genre,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Palette.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: width * 0.90,
                  child: const Divider(
                    height: 1.0,
                    color: Color.fromARGB(255, 71, 71, 71),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: FutureBuilder<List<Book>>(
                    future: _fetchBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Skeletonizer(
                          child: SizedBox(
                            height: height * 0.7,
                            child: ListView.separated(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height * 0.2,
                                        width: width * 0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: height * 0.02,
                                            width: width * 0.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: width * 0.5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: height * 0.02,
                                            width: width * 0.3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ]);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              SvgPicture.asset(Images.error),
                              const Text(
                                  'Something went wrong.Please Refresh Page.'),
                            ],
                          ),
                        );
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final List<Book> books = snapshot.data!;
                        return SizedBox(
                          height: height * 0.7,
                          child: AnimationLimiter(
                            child: ListView.separated(
                              itemCount: books.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: FlipAnimation(
                                    flipAxis: FlipAxis.y,
                                    child: InkWell(
                                      onTap: () => Get.to(
                                        () => BookPreview(
                                            bookTitle: books[index].title!,
                                            authorName: books[index].author!,
                                            desc: books[index].desc!,
                                            genres: books[index].genres!,
                                            price: books[index].price!,
                                            image: books[index].image!,
                                            authorId: books[index].authorId!,
                                            genreIds: books[index].genreIds!,
                                            ratings: books[index].ratings!,
                                            comments: books[index].comments!,
                                            pages: books[index].pages!),
                                      ),
                                      child: BookInfo(
                                        book: books[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: width * 0.90,
                                  child: const Divider(
                                    height: 1.0,
                                    color: Color.fromARGB(255, 71, 71, 71),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        return Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Images.noBooks),
                            const Text('No Books Available?'),
                            const Text('Try a different Genre'),
                          ],
                        ));
                      }
                    },
                  ),
                ),
              ],
            ),
            FutureBuilder<int>(
                future: _getLastPage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Positioned(
                      right: 5,
                      bottom: 40,
                      child: loader(),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    return Positioned(
                        right: 5,
                        bottom: 40,
                        child: changePage(
                          height,
                          width,
                          currentPage,
                          snapshot.data!,
                          () {
                            _fetchBooks();
                            _getLastPage();
                            setState(() {
                              loading = true;
                              currentPage -= 1;
                            });
                          },
                          () {
                            _fetchBooks();
                            _getLastPage();
                            setState(() {
                              loading = true;
                              currentPage += 1;
                            });
                          },
                        ));
                  } else if (snapshot.hasError) {
                    return const SizedBox.shrink();
                  } else {
                    return const SizedBox.shrink();
                  }
                })
          ],
        ),
      ),
    );
  }
}
