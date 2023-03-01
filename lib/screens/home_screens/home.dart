import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool bookshelf = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.07, top: height * 0.03, bottom: height*0.095),
      child: Stack(
        children: [
          appBar(height, width),
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  bookshelf ? const BookShelf() : const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //APPBar
  Widget appBar(double height, width) {
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.07,
      ),
      child: SizedBox(
        height: height * 0.065,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print('Bookshelf');
                    setState(() {
                      bookshelf = true;
                    });
                  },
                  child: Text(
                    'Bookshelf',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: bookshelf
                            ? const Color.fromARGB(255, 237, 112, 23)
                            : Colors.grey),
                  ),
                ),
                bookshelf
                    ? Container(
                        width: width * 0.15,
                        height: height * 0.002,
                        color: const Color.fromARGB(255, 237, 112, 23))
                    : const SizedBox.shrink()
              ],
            ),
            VerticalDivider(
              color: Colors.grey,
              width: width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      print('Art Gallery');
                      setState(() {
                        bookshelf = false;
                      });
                    },
                    child: Text(
                      'Art Gallery',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: !bookshelf
                              ? const Color.fromARGB(255, 237, 112, 23)
                              : Colors.grey),
                    )),
                !bookshelf
                    ? Container(
                        width: width * 0.15,
                        height: height * 0.002,
                        color: const Color.fromARGB(255, 237, 112, 23))
                    : const SizedBox.shrink()
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 41, 45, 50),
                ))
          ],
        ),
      ),
    );
  }
}
