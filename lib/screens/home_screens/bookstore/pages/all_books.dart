import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage>
    with AutomaticKeepAliveClientMixin<AllPage> {
  @override
  bool get wantKeepAlive => true;
  String token = '';
  int currentPage = 1;
  bool loading = false;
  bool loadingPopular = false;
  int popularPage = 1;

  @override
  void initState() {
    super.initState();
    _books();
    _popularBooks();
    _getLastPage();
    _getPopularLastPage();
  }

  Future<int> _getLastPage() async {
    int lastpage = await AllBooks().getAllBooksLastPage(token);
    return lastpage;
  }

  Future<int> _getPopularLastPage() async {
    int page = await AllBooks().getPopularBooksLastPage(token);
    return page;
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
  Future<List<Book>> _books() async {
    await getToken();

    List<Book> allBooks = await AllBooks().getBooks(
      token,
      currentPage.toString(),
    );

    return allBooks;
  }

  Future<List<Book>> _popularBooks() async {
    await getToken();

    List<Book> popularBooks = await AllBooks().getPopularBooks(
      token,
      popularPage.toString(),
    );
    return popularBooks;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              //All books
              Row(
                children: [
                  const Text(
                    'All Books',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: width * 0.6,
                  )),
                  FutureBuilder<int>(
                    future: _getLastPage(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return loader();
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return changePage(
                          height,
                          width,
                          currentPage,
                          snapshot.data!,
                          () {
                            _books();
                            setState(() {
                              currentPage -= 1;
                            });
                          },
                          () {
                            _books();
                            setState(() {
                              currentPage += 1;
                            });
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                ],
              ),

              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                height: height * 0.4,
                child: FutureBuilder<List<Book>>(
                    future: _books(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Skeletonizer(
                          child: SizedBox(
                            height: height * 0.7,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height * 0.3,
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
                                      )
                                    ]);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 15,
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text(
                                'Something went wrong. Please Refresh Page.'));
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        List<Book> books = snapshot.data!;
                        return AnimationLimiter(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: books.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      bookCover(width * 1.5, height * 1.5,
                                          books[index].image!, () {
                                        Get.to(BookPreview(
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
                                          pages: books[index].pages!,
                                        ));
                                      }),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      SizedBox(
                                        width: width * 0.3,
                                        child: Text(
                                          books[index].title!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'GHS ${books[index].price!.toString()}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: width * 0.3,
                                        child: Text(
                                          books[index].author!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Images.noBooks),
                            const Text('No Books Available?'),
                            const Text('Check your Internet Connection'),
                          ],
                        ));
                      }
                    }),
              ),

              // Popular Books
              SizedBox(
                height: height * 0.013,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    const Text(
                      'Popular Books',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: width,
                    )),
                    FutureBuilder<int>(
                      future: _getPopularLastPage(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return loader();
                        } else if (snapshot.hasData && snapshot.data != null) {
                          return changePage(
                            height,
                            width,
                            popularPage,
                            snapshot.data!,
                            () {
                              _popularBooks();
                              setState(() {
                                popularPage -= 1;
                              });
                            },
                            () {
                              _popularBooks();
                              setState(() {
                                popularPage += 1;
                              });
                            },
                          );
                        } else if (snapshot.hasError) {
                          return const SizedBox.shrink();
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                height: height * 0.210,
                child: FutureBuilder<List<Book>>(
                    future: _popularBooks(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Skeletonizer(
                          child: SizedBox(
                            height: height * 0.7,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: height * 0.2,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 10,
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong.'));
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        List<Book> popularbook = snapshot.data!;
                        return AnimationLimiter(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: popularbook.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: ScaleAnimation(
                                    scale: 1.5,
                                    child: bookCover(width, height,
                                        popularbook[index].image!, () {
                                      Get.to(
                                        BookPreview(
                                          bookTitle: popularbook[index].title!,
                                          authorName:
                                              popularbook[index].author!,
                                          desc: popularbook[index].desc!,
                                          genres: popularbook[index].genres!,
                                          price: popularbook[index].price!,
                                          image: popularbook[index].image!,
                                          authorId:
                                              popularbook[index].authorId!,
                                          genreIds:
                                              popularbook[index].genreIds!,
                                          ratings: popularbook[index].ratings!,
                                          comments:
                                              popularbook[index].comments!,
                                          pages: popularbook[index].pages!,
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              }),
                        );
                      }
                      return Skeletonizer(
                        child: SizedBox(
                          height: height * 0.7,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                height: height * 0.2,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),

              // // Most Read this week
              // const Padding(
              //   padding: EdgeInsets.only(left: 8),
              //   child: Text(
              //     'Most Read this week',
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // SizedBox(
              //   height: height * 0.210,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: book.length,
              //       itemBuilder: (
              //         BuildContext context,
              //         int index,
              //       ) {
              //         Book books = book[index];
              //         return InkWell(
              //         onTap: () {
              //           Get.to(
              //             () => BookPreview(
              //               bookTitle: books.title,
              //               authorName: books.author,
              //             ),
              //           );
              //         },
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(
              //                 width: width * 0.3,
              //                 height: height * 0.210,
              //                 child: Image.asset(
              //                   books.image,
              //                   fit: BoxFit.fill,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       }),
              // ),

              // const SizedBox(
              //   height: 8,
              // ),

              // // Bestsellers Books
              // const Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Text(
              //     'Bestsellers Books',
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // SizedBox(
              //   height: height * 0.210,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: book.length,
              //       itemBuilder: (
              //         BuildContext context,
              //         int index,
              //       ) {
              //         Book books = book[index];
              //         return InkWell(
              //         onTap: () {
              //           Get.to(
              //             () => BookPreview(
              //               bookTitle: books.title,
              //               authorName: books.author,
              //             ),
              //           );
              //         },
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(
              //                 width: width * 0.3,
              //                 height: height * 0.210,
              //                 child: Image.asset(
              //                   books.image,
              //                   fit: BoxFit.fill,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       }),
              // ),

              // const SizedBox(
              //   height: 8,
              // ),

              // // Newly Added Books
              // const Padding(
              //   padding: EdgeInsets.only(left: 8.0),
              //   child: Text(
              //     'Newly Added Books',
              //     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // SizedBox(
              //   height: height * 0.210,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: book.length,
              //       itemBuilder: (
              //         BuildContext context,
              //         int index,
              //       ) {
              //         Book books = book[index];
              //         return InkWell(
              //         onTap: () {
              //           Get.to(
              //             () => BookPreview(
              //               bookTitle: books.title,
              //               authorName: books.author,
              //             ),
              //           );
              //         },
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(
              //                 width: width * 0.3,
              //                 height: height * 0.210,
              //                 child: Image.asset(
              //                   books.image,
              //                   fit: BoxFit.fill,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
