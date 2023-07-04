import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_app/screens/creator_dashboards/sales.dart';

import '../../shared/exports.dart';

class CreatorHome extends StatefulWidget {
  const CreatorHome({super.key});

  @override
  State<CreatorHome> createState() => _CreatorHomeState();
}

class _CreatorHomeState extends State<CreatorHome> {
  int currentpageIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> pages = [
      const Dashboard(),
      const Sales(),
    ];
    return Scaffold(
      body: Stack(
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
                      PhosphorIcons.bold.house,
                      currentpageIndex == 0
                          ? Colors.white
                          : const Color.fromARGB(255, 41, 45, 50), () {
                    setState(() {
                      currentpageIndex = 0;
                    });
                    pageController.jumpToPage(0);
                    print('home');
                  }),

                  //Sales
                  navBarItem(
                      'Sales',
                      height,
                      PhosphorIcons.bold.chartBar,
                      currentpageIndex == 1
                          ? Colors.white
                          : const Color.fromARGB(255, 41, 45, 50), () {
                    setState(() {
                      currentpageIndex = 1;
                    });
                    pageController.jumpToPage(
                      1,
                    );
                    print('BooksStore');
                  }),

                  //Profile
                  navBarItem(
                      'Profile',
                      height,
                      PhosphorIcons.bold.user,
                      currentpageIndex == 2
                          ? Colors.white
                          : const Color.fromARGB(255, 41, 45, 50), () {
                    setState(() {
                      currentpageIndex = 2;
                    });
                    pageController.jumpToPage(
                      2,
                    );
                    print('Search');
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
