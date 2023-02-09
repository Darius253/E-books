
import 'package:flutter/material.dart';
import 'package:reader_app/screens/bookstore/pages/book_info.dart';
import 'package:reader_app/shared/exports.dart';

class ComedyPage extends StatefulWidget {
  const ComedyPage({super.key});

  @override
  State<ComedyPage> createState() => _ComedyPageState();
}

class _ComedyPageState extends State<ComedyPage> {
  String genrePage = 'comedy';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Comedy", style: TextStyle(
            fontSize: 24,
            color: Palette.black,
            fontWeight: FontWeight.w500,
          ),
          ),
          SizedBox(height: 10,),
          ListView.builder(
              itemCount: infodata.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  child: Column(
                            children: [
                              BookInfo(bookInfoData: infodata[index],),
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
        ],
      ),
    );
  }
}