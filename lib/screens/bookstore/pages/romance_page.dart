
import 'package:flutter/material.dart';
import 'package:reader_app/screens/bookstore/pages/book_info.dart';
import 'package:reader_app/shared/exports.dart';

class RomancePage extends StatefulWidget {
  const RomancePage({super.key});

  @override
  State<RomancePage> createState() => _RomancePageState();
}

class _RomancePageState extends State<RomancePage> {
  String genrePage = 'romance';
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