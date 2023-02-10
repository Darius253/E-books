
import 'package:flutter/material.dart';
import 'package:reader_app/screens/bookstore/pages/book_info.dart';
import 'package:reader_app/shared/exports.dart';

class ActsPage extends StatefulWidget {
  const ActsPage({super.key});

  @override
  State<ActsPage> createState() => _ActsPageState();
}

class _ActsPageState extends State<ActsPage> {
  String genrePage = 'acts';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Comedy",
            style: TextStyle(
              fontSize: 24,
              color: Palette.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: infodata.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      BookInfo(
                        bookInfoData: infodata[index],
                      ),
                      if (index != infodata.length - 1)
                        Divider(
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}