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
      const Library(),
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 237, 112, 23)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home
                  navBarItem(
                      'Home',
                      height,
                      CupertinoIcons.home,
                      currentpageIndex == 0
                          ? Colors.white
                          : const Color.fromARGB(201, 204, 200, 196), () {
                    setState(() {
                      currentpageIndex = 0;
                    });
                    pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                    print('home');
                  }),

                  //BookSTore
                  navBarItem(
                      'Bookstore',
                      height,
                      CupertinoIcons.book,
                      currentpageIndex == 1
                          ? Colors.white
                          : const Color.fromARGB(201, 204, 200, 196), () {
                    setState(() {
                      currentpageIndex = 1;
                    });
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                    print('Booksstore');
                  }),

                  //Search
                  navBarItem(
                      'Search',
                      height,
                      CupertinoIcons.search_circle,
                      currentpageIndex == 2
                          ? Colors.white
                          : const Color.fromARGB(201, 204, 200, 196), () {
                    setState(() {
                      currentpageIndex = 2;
                    });
                    pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                    print('Search');
                  }),

                  //ArtStore
                  navBarItem(
                      'Art Store',
                      height,
                      Icons.store_mall_directory_outlined,
                      currentpageIndex == 3
                          ? Colors.white
                          : const Color.fromARGB(201, 204, 200, 196), () {
                    setState(() {
                      currentpageIndex = 3;
                    });
                    pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                    print('Art Store');
                  }),

                  //Library
                  navBarItem(
                      'Library',
                      height,
                      Icons.bookmarks_outlined,
                      currentpageIndex == 4
                          ? Colors.white
                          : const Color.fromARGB(201, 204, 200, 196), () {
                    setState(() {
                      currentpageIndex = 4;
                    });
                    pageController.animateToPage(4,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceIn);
                    print('Library');
                  }),
                ],
              ),
            ))
      ],
    )));
  }
}
