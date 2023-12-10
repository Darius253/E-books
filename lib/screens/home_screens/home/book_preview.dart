import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookPreview extends StatefulWidget {
  final String bookTitle;
  final String authorName;
  final String desc;
  final double price;
  final List<String> genres;
  final List<int> genreIds;
  final String image;
  final List<int> ratings;
  final List<String> comments;
  final String authorId;
  final int pages;
  const BookPreview({
    super.key,
    required this.bookTitle,
    required this.authorName,
    required this.desc,
    required this.genres,
    required this.price,
    required this.image,
    required this.authorId,
    required this.genreIds,
    required this.ratings,
    required this.comments,
    required this.pages,
  });

  @override
  State<BookPreview> createState() => _BookPreviewState();
}

class _BookPreviewState extends State<BookPreview> {
  String token = '';
  Future<List<Book>>? book;
  Future<List<Book>>? booksByAuthor;

  @override
  void initState() {
    super.initState();
    _fetchRelatedBooks();
    _fetchAuthorBooks();
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
  Future<void> _fetchRelatedBooks() async {
    await getToken();

    List<Book> fetchedBooks =
        await FavGenreBooks().getfavBooks(token, widget.genreIds[0], '1');
    if (mounted) {
      setState(() {
        book = Future.value(fetchedBooks);
      });
    }
  }

  //author Books
  Future<void> _fetchAuthorBooks() async {
    await getToken();

    List<Book> fetchedBooks =
        await AuthorBooks().authorBooks(token, widget.authorId);
    if (mounted) {
      setState(() {
        booksByAuthor = Future.value(fetchedBooks);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            appBar(width, height, widget.bookTitle, true),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.075,
                left: width * 0.07,
                right: width * 0.07,
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: width * 0.7,
                            height: height * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: widget.image,
                                filterQuality: FilterQuality.low,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Palette.primary,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        bookInfo(
                          width,
                          height,
                          widget.bookTitle,
                          widget.authorName,
                          () => Get.to(AuthorPreview(
                            authorName: widget.authorName,
                            id: widget.authorId,
                          )),
                          widget.ratings,
                          widget.comments,
                          widget.pages,
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Book Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          widget.desc,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        SizedBox(
                          height: height * 0.05,
                          width: width,
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: width * 0.7,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return relatedGenres(
                                      widget.genres[index],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: width * 0.025,
                                    );
                                  },
                                  itemCount: widget.genres.length),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        button(height, widget.price.toString(),
                            widget.bookTitle, widget.authorName)
                      ]),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemType(width, 'Comments'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      widget.comments.isNotEmpty
                          ? SizedBox(
                              height: height * 0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return commentsCard(width, height, null,
                                        widget.comments[index]);
                                  },
                                  itemCount: widget.comments.length),
                            )
                          : const Center(
                              child:
                                  Text('There are no comments for this book.')),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () => Get.to(() => const ReviewPage()),
                          child: const Text(
                            'Leave a review',
                            style: TextStyle(
                              color: Color(0xFF8C3E04),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.045,
                      ),
                      itemType(width, 'Related Books'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: FutureBuilder<List<Book>>(
                            future: book,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return loader();
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child:
                                        Text('Error: Something went wrong.'));
                              } else if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                List<Book> groupedBooks = snapshot.data!;
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return bookCover(width, height,
                                          groupedBooks[index].image!, () {
                                        Get.to(
                                          BookPreview(
                                            bookTitle:
                                                groupedBooks[index].title!,
                                            authorName:
                                                groupedBooks[index].author!,
                                            desc: groupedBooks[index].desc!,
                                            genres: groupedBooks[index].genres!,
                                            price: groupedBooks[index].price!,
                                            image: groupedBooks[index].image!,
                                            authorId:
                                                groupedBooks[index].authorId!,
                                            genreIds:
                                                groupedBooks[index].genreIds!,
                                            ratings:
                                                groupedBooks[index].ratings!,
                                            comments:
                                                groupedBooks[index].comments!,
                                            pages: groupedBooks[index].pages!,
                                          ),
                                        );
                                      });
                                    },
                                    itemCount: groupedBooks.length);
                              } else {
                                return Center(
                                  child: SvgPicture.asset(
                                      'assets/images/no_data.svg'),
                                );
                              }
                            }),
                      ),
                      SizedBox(
                        height: height * 0.045,
                      ),
                      itemType(width, 'Other books by the author'),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: FutureBuilder<List<Book>>(
                            future: booksByAuthor,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return loader();
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child:
                                        Text('Error: Something went wrong.'));
                              } else if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                List<Book> authorBooks = snapshot.data!;
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return bookCover(
                                        width,
                                        height,
                                        authorBooks[index].image!,
                                        () {
                                          Get.to(
                                            BookPreview(
                                              bookTitle:
                                                  authorBooks[index].title!,
                                              authorName:
                                                  authorBooks[index].author!,
                                              desc: authorBooks[index].desc!,
                                              genres:
                                                  authorBooks[index].genres!,
                                              price: authorBooks[index].price!,
                                              image: authorBooks[index].image!,
                                              authorId:
                                                  authorBooks[index].authorId!,
                                              genreIds:
                                                  authorBooks[index].genreIds!,
                                              ratings: authorBooks[index]
                                                          .ratings !=
                                                      null
                                                  ? authorBooks[index].ratings!
                                                  : [],
                                              comments:
                                                  authorBooks[index].comments!,
                                              pages: authorBooks[index].pages!,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    itemCount: authorBooks.length);
                              } else {
                                return Center(
                                  child: SvgPicture.asset(
                                      'assets/images/no_data.svg'),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
