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
      padding: EdgeInsets.only(top: height * 0.01, bottom: height * 0.095),
      child: Stack(
        children: [
          appBar(height, width),
          Padding(
            padding: EdgeInsets.only(top: height * 0.07),
            child: bookshelf ? const BookShelf() : const ArtGallery(),
          )
        ],
      ),
    );
  }

  //APPBar
  Widget appBar(double height, double width) {
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
                InkWell(
                  onTap: () {
                    print('Bookshelf');
                    setState(() {
                      bookshelf = true;
                    });
                  },
                  child: Text(
                    'Bookshelf',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: bookshelf
                            ? const Color.fromARGB(255, 237, 112, 23)
                            : Colors.grey),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    width: width * 0.15,
                    height: height * 0.002,
                    color: bookshelf
                        ? const Color.fromARGB(255, 237, 112, 23)
                        : Colors.transparent)
              ],
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Container(
              color: Colors.grey,
              width: width * 0.003,
              height: height * 0.03,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      print('Art Gallery');
                      setState(() {
                        bookshelf = false;
                      });
                    },
                    child: Text(
                      'Art Gallery',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: !bookshelf
                              ? const Color.fromARGB(255, 237, 112, 23)
                              : Colors.grey),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    width: width * 0.15,
                    height: height * 0.002,
                    color: !bookshelf
                        ? const Color.fromARGB(255, 237, 112, 23)
                        : Colors.transparent)
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {
                  Get.to(const ProfilePage());
                },
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
