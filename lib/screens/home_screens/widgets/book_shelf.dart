import 'dart:async';
import 'package:flutter/material.dart';
import '../../../shared/exports.dart';

class BookShelf extends StatefulWidget {
  @override
  const BookShelf({Key? key}) : super(key: key);

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  List<int> genre = [];
  String token = '';
  List<String> favGeners = [];

  @override
  void initState() {
    super.initState();
    favGenres();
    _fetchBooks();
  }

  Future<void> getToken() async {
    final person = boxPersons.get('personDetails');

    if (person != null && person is Person) {
      setState(() {
        token = person.token;
      });
    }
  }

  // Getting favourite Genres
  Future<void> favGenres() async {
    final favGneres = boxGenres.get('favGenres');

    if (favGneres != null && favGneres is FavGenres) {
      setState(() {
        genre = favGneres.genres;
      });
    }

    for (int id in genre) {
      Genre favGenre = genres.firstWhere((element) => element.id == id);

      favGeners.add(favGenre.genre);
    }
  }

  // Getting Books
  Future<Map<String, List<Book>>> _fetchBooks() async {
    await getToken();

    Map<String, List<Book>> groupedBooks = {};

    for (int id in genre) {
      List<Book> fetchedBooks =
          await FavGenreBooks().getfavBooks(token, id, '1');

      Genre favGenre = genres.firstWhere((element) => element.id == id);
      String genreName = favGenre.genre;

      if (groupedBooks.containsKey(genreName)) {
        groupedBooks[genreName]!.addAll(fetchedBooks);
      } else {
        groupedBooks[genreName] = fetchedBooks;
      }
    }

    return groupedBooks;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: height * 0.4,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(left: width * 0.07),
            //             child: const Text(
            //               'Currently Reading',
            //               style: TextStyle(
            //                   fontSize: 16, fontWeight: FontWeight.w600),
            //             ),
            //           ),
            //           container(width, height, context, ''),
            //         ],
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(left: width * 0.07),
            //             child: const Text(
            //               'New Releases',
            //               style: TextStyle(
            //                   fontSize: 16, fontWeight: FontWeight.w600),
            //             ),
            //           ),
            //           container(width, height, context, ''),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: height * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: FutureBuilder<Map<String, List<Book>>>(
                  future: _fetchBooks(), // Use the book Future
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Skeletonizer(
                        child: SizedBox(
                          height: height * 0.7,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.4,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                              width: width * 0.4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: height * 0.2,
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
                                );
                              }),
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
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      Map<String, List<Book>> groupedBooks = snapshot.data!;
                      return AnimationLimiter(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 400),
                                childAnimationBuilder: (widget) =>
                                    ScaleAnimation(
                                  child: SlideAnimation(
                                    horizontalOffset: -100.0,
                                    child: widget,
                                  ),
                                ),
                                children: [
                                  for (String genreName in groupedBooks.keys)
                                    favouriteGenre(
                                      height,
                                      width,
                                      genreName,
                                      context,
                                      groupedBooks[genreName]!.length,
                                      groupedBooks[genreName]!,
                                    ),
                                ],
                              )));
                    } else {
                      return Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Images.noBooks),
                          const Text('No Books Available?'),
                          const Text('Update your Favourite Genres'),
                        ],
                      ));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  // Widget container(
  //     double width, double height, BuildContext context, String image) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SizedBox(
  //         height: height * 0.02,
  //       ),
  //       Padding(
  //         padding: EdgeInsets.only(
  //           left: width * 0.07,
  //         ),
  //         child: Container(
  //           padding: EdgeInsets.symmetric(vertical: height * 0.01),
  //           width: width * 0.7,
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               border:
  //                   Border.all(color: const Color.fromARGB(255, 140, 63, 4))),
  //           child: genreBook(
  //               height, width, 'My Life', 'Darius', 89, context, image),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget favouriteGenre(double height, double width, String genre,
      BuildContext context, int length, List<Book> book) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.07,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Because you like $genre ',
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Based on your favourite genres',
            style: TextStyle(
                height: 2,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          SizedBox(
            height: height * 0.35,
            width: width,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: height * 0.05,
                  );
                },
                itemCount: length,
                itemBuilder: (BuildContext context, int index) {
                  return genreBook(
                    height,
                    width,
                    book[index].title!,
                    book[index].author!,
                    book[index].price!,
                    context,
                    book[index].image!,
                    book[index].desc!,
                    book[index].genres!,
                    book[index].ratings!,
                    book[index].comments!,
                    book[index].authorId!,
                    book[index].genreIds!,
                    book[index].pages!,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget genreBook(
    double height,
    double width,
    String title,
    String author,
    double price,
    BuildContext context,
    String image,
    String desc,
    List<String> bookGenres,
    List<int> ratings,
    List<String> comments,
    String authorId,
    List<int> genreIds,
    int pages,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: BookPreview(
                bookTitle: title,
                authorName: author,
                genres: bookGenres,
                price: price,
                image: image,
                desc: desc,
                ratings: ratings,
                comments: comments,
                authorId: authorId,
                genreIds: genreIds,
                pages: pages,
              ))),
      child: Padding(
        padding: EdgeInsets.only(
          right: width * 0.07,
        ),
        child: SizedBox(
          width: width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.4,
                height: height * 0.22,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 206, 205, 205),
                    border: Border.all(
                        color: const Color.fromARGB(255, 140, 63, 4)),
                    borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    filterQuality: FilterQuality.low,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => loader(),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'By $author',
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                'GHS $price',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color.fromARGB(255, 140, 63, 4)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
