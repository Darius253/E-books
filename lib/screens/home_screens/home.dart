import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.03),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.045,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox()),
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
                 VerticalDivider(
                  color: Colors.grey,
                  width: width*0.05,
                ),
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
        ],
      ),
    );
  }
}
