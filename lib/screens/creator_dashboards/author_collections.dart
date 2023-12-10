import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/upload_book.dart';
import '../../shared/exports.dart';

class AuthorCollections extends StatefulWidget {
  const AuthorCollections({super.key});

  @override
  State<AuthorCollections> createState() => _AuthorCollectionsState();
}

class _AuthorCollectionsState extends State<AuthorCollections> {
  String token = '';
  Future<List<Book>>? book;
  Future<List<Book>>? booksByAuthor;
  String? authorID;

  @override
  void initState() {
    super.initState();
    _fetchAuthorBooks();
  }

  Future<void> _fetchAuthorBooks() async {
    await getToken();

    List<Book> fetchedBooks = await AuthorBooks().authorBooks(token, authorID!);
    if (mounted) {
      setState(() {
        booksByAuthor = Future.value(fetchedBooks);
      });
    }
  }

  Future<void> getToken() async {
    final person = boxPersons.get('personDetails');

    if (person != null && person is Person) {
      setState(() {
        token = person.token;
        authorID = person.userId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return FutureBuilder<List<Book>>(
        future: booksByAuthor,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loader();
          } else if (snapshot.hasError) {
            return const Center(
                child: Center(child: Text('Error: Something went wrong.')));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Book> authorBooks = snapshot.data!;
            return MasonryGridView.builder(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              mainAxisSpacing: 16,
              crossAxisSpacing: 5,
              itemCount: authorBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return collection(
                  width,
                  Random().nextInt(150) + 50.5,
                  authorBooks[index].author,
                  authorBooks[index].title,
                  authorBooks[index].price.toString(),
                  14,
                  context,
                  authorBooks[index].image,
                  authorBooks[index].releaseDate,
                  authorBooks[index].desc,
                  authorBooks[index].pseudonym,
                  authorBooks[index].pages.toString(),
                  authorBooks[index].isbn,
                  authorBooks[index].edition,
                  authorBooks[index].language,
                  '',
                  authorBooks[index].genres,
                );
              },
            );
          } else {
            return Center(
              child: SvgPicture.asset('assets/images/no_data.svg'),
            );
          }
        });
  }
}

Widget collection(
  double? width,
  double? height,
  String? artist,
  String? title,
  String? price,
  double? fontSize,
  BuildContext context,
  String? image,
  String? selectedDate,
  String? description,
  String? pseudonym,
  String? pages,
  String? isbn,
  String? edition,
  String? language,
  String? book,
  List<String>? selectedGenres,
) {
  return Padding(
    padding: EdgeInsets.only(
      left: width! * 0.07,
    ),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.size,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.bottomCenter,
            child: UploadBook(
              bookCover: image,
              title: title!,
              selectedDate: selectedDate,
              pseudonym: pseudonym,
              edition: edition,
              language: language,
              price: price,
              pages: pages,
              description: description,
              isbn: isbn,
              selectedGenres: selectedGenres,
            ),
            isIos: true),
      ),
      child: artist == null
          ? Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  color: Colors.black),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: width * 0.7,
                    // height: height! * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: image!,
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(
                            child: Container(
                          color: Colors.grey,
                          height: height! * 0.4,
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height! * 0.03,
                ),
                Text(
                  artist,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  title!,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                const Text(
                  'View',
                  style: TextStyle(
                    color: Color(0xFF8C3E04),
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
    ),
  );
}
