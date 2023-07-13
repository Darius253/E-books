import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpageIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Home(),
      const BookStore(),
      const SearchPage(),
      const ArtGallery(),
      const LibraryPage(),
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: pages,
              onPageChanged: (value) {
                currentpageIndex = value;
              },
            ),
            Positioned(
              bottom: 1,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: width,
                height: height * 0.09,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 237, 112, 23)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Home
                    navBarItem(
                        'Home',
                        height,
                        currentpageIndex == 0
                            ? PhosphorIcons.regular.house
                            : PhosphorIcons.fill.house,
                        currentpageIndex == 0
                            ? Colors.white
                            : const Color.fromARGB(200, 182, 180, 178), () {
                      setState(() {
                        currentpageIndex = 0;
                      });
                      pageController.jumpToPage(0);
                      print('home');
                    }),

                    //BookSTore
                    navBarItem(
                        'Bookstore',
                        height,
                        currentpageIndex == 1
                            ? PhosphorIcons.regular.books
                            : PhosphorIcons.fill.bookBookmark,
                        currentpageIndex == 1
                            ? Colors.white
                            : const Color.fromARGB(201, 204, 200, 196), () {
                      setState(() {
                        currentpageIndex = 1;
                      });
                      pageController.jumpToPage(
                        1,
                      );
                      print('BooksStore');
                    }),

                    //Search
                    navBarItem(
                        'Search',
                        height,
                        currentpageIndex == 2
                            ? PhosphorIcons.regular.magnifyingGlass
                            : CupertinoIcons.search_circle,
                        currentpageIndex == 2
                            ? Colors.white
                            : const Color.fromARGB(201, 204, 200, 196), () {
                      setState(() {
                        currentpageIndex = 2;
                      });
                      pageController.jumpToPage(
                        2,
                      );
                      print('Search');
                    }),

                    //ArtStore
                    navBarItem(
                        'Art Store',
                        height,
                        currentpageIndex == 3
                            ? PhosphorIcons.regular.storefront
                            : Icons.store_mall_directory_outlined,
                        currentpageIndex == 3
                            ? Colors.white
                            : const Color.fromARGB(201, 204, 200, 196), () {
                      setState(() {
                        currentpageIndex = 3;
                      });
                      pageController.jumpToPage(3);
                      print('Art Store');
                    }),

                    //Library
                    navBarItem(
                        'Library',
                        height,
                        currentpageIndex == 4
                            ? PhosphorIcons.bold.bookmarks
                            : PhosphorIcons.bold.bookmarksSimple,
                        currentpageIndex == 4
                            ? Colors.white
                            : const Color.fromARGB(201, 204, 200, 196), () {
                      setState(() {
                        currentpageIndex = 4;
                      });
                      pageController.jumpToPage(
                        4,
                      );
                      print('Library');
                    }),
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
