// import 'package:book_shop/data/json.dart';
// import 'package:book_shop/theme/colors.dart';
// import 'package:book_shop/widgets/avatar_image.dart';
// import 'package:book_shop/widgets/book_card.dart';
// import 'package:book_shop/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/bookstore/book_cover.dart';
import 'package:reader_app/screens/bookstore/genre_chips.dart';
import 'package:reader_app/shared/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.white,
        body: getStackBody(),
      ),
    );
  }

//Create title and chips
  getTopBlock() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      color: Colors.transparent,
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
            Text(
              "BookStore",
              style: TextStyle(
                  color: Palette.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w600),
            ),
             SizedBox(
              height: 8,
            ),
            Expanded(child: GenreChips()),
             SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  getStackBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: getTopBlock(),
                ),
                Positioned(
                    top: 140,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 260,
                      child: getPopularBooks(),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: const Text(
                    "Trending Books",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 15,
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 15),
              //   child: getLatestBooks(),
              // ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }

  getPopularBooks() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5, left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(books.length,
            (index) => BookCover(bookData: books[index], height: 210, onTap: () {  }, width: 130,)),
      ),
    );
  }

  // getLatestBooks() {
  //   return SingleChildScrollView(
  //     padding: EdgeInsets.only(bottom: 5),
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: List.generate(
  //           latestBooks.length, (index) => BookCover(book: latestBooks[index]),
  //           ),
  //     ),
  //   );
  // }
}
