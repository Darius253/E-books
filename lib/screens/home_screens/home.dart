import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.03),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              const Text('Bookshelf'),
              VerticalDivider(
                width: width * 0.05,
                thickness: width * 0.05,
                color: Colors.grey,
              ),
              const Text('Art Gallery'),
              const Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 41, 45, 50),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
